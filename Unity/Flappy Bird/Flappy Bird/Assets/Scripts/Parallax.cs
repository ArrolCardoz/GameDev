
using UnityEngine;

public class Parallax : MonoBehaviour
{
    [SerializeField]
    float AnimationSpeed = 1f;
    private MeshRenderer meshRenderer; 

    void Awake()
    {
        meshRenderer = GetComponent<MeshRenderer>();
    }

    void Update()
    {
        meshRenderer.material.mainTextureOffset += new Vector2 (AnimationSpeed * Time.deltaTime, 0);
        
    }
}
