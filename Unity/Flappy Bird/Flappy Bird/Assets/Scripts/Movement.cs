using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Movement : MonoBehaviour
{
    private Vector3 Direction;
    [SerializeField]
    private float Gravity;
    [SerializeField]
    private float Strength;
    [SerializeField]
    private Sprite[] sprites;
    private SpriteRenderer SpriteRenderer;
    private int SpriteIndex = 0;


    private void Awake() {
        SpriteRenderer = GetComponent<SpriteRenderer>();
    }

    private void Start() {
        InvokeRepeating(nameof(AnimateSprite),0.20f,0.20f);
    }


    private void Update() {
        if(Input.GetKeyDown(KeyCode.Space) || Input.GetMouseButtonDown(0))
            Direction = Vector3.up * Strength;

        Direction.y += Gravity * Time.deltaTime;
        transform.position += Direction * Time.deltaTime;

    }

    private void AnimateSprite(){
        SpriteIndex++;
        if(SpriteIndex>=sprites.Length)
        SpriteIndex = 0;
        SpriteRenderer.sprite = sprites[SpriteIndex];

    }


}//class
