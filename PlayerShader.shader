Shader "Unlit/PlayerShader"
{
    // Shader var's
    Properties
    {
        _MainTex ("Main SpriteSheet", 2D) = "white" {}
        _SwapTex ("Current SpriteSheet", 2D) = "white" {}
        _Color("Tint", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags 
        { 
            "QUEUE" = "Transparent" 
            "IGNOREPROJECTOR" = "true" 
            "RenderType" = "Transparent" 
        }

        LOD 100
        // Represents one execution of the vert & frag shaders
        Pass
        {
            // Make the shader transparent
            Tags { "QUEUE" = "Transparent" "IGNOREPROJECTOR" = "true" "RenderType" = "Transparent" }
            // This prevents weird white boxes from showing up
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            // Vertex shader inputs
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            // Vertex shader outputs
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            sampler2D _SwapTex;
            float4 _MainTex_ST;
            float4 _SwapTex_ST;

            //  The Vertex Shader
            v2f vert (appdata v)
            {
                // v.vertex = UnityPixelSnap(v.vertex);
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex); // Passing Texture Coordinates
                return o;
            }

            // The Fragment Shader - this is where the magic happens
            fixed4 frag (v2f i) : SV_Target
            {
                // Sample the _SwapTex here
                fixed4 col = tex2D(_SwapTex, i.uv);
                return col;
            }
            ENDCG
        }
    }
}
