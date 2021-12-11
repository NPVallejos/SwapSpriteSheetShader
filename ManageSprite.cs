using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManageSprite : MonoBehaviour
{
    [Tooltip("Place Player sprite sheets here.")]
    public List<Texture2D> PlayerSpriteSheets;
    private SpriteRenderer m_spriteRenderer;

    void Awake()
    {
        // Get sprite renderer
        m_spriteRenderer = GetComponent<SpriteRenderer>();
    }
    
    /// <summary>
    /// this will swap our used animator texture to another one
    /// </summary>
    /// <param name="_toWhat"></param>
    public void SwapTexture(int _targetSpriteSheetIndex)
    {
        if (m_spriteRenderer)
            m_spriteRenderer.material.SetTexture("_SwapTex", PlayerSpriteSheets[_targetSpriteSheetIndex]);
        else
            Debug.LogError("Missing sprite renderer for gameobject " + this.name);
    }
    
    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
            SwapTexture(0);
        if (Input.GetKeyDown(KeyCode.Alpha2))
            SwapTexture(1);   
    }
}
