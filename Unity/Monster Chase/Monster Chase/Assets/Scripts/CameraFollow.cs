using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    private Transform player;
    private Vector3 TempPos;
    [SerializeField]
    private float MinX, MaxX;
    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.FindWithTag("Player").transform; 
        
    }
 
    // Update is called once per frame
    void LateUpdate()
    {

        if(!player)
        return;
        TempPos = transform.position;
        TempPos.x = player.position.x;
        if(TempPos.x > MaxX){
            TempPos.x = MaxX;
        }

        else if (TempPos.x <MinX){
            TempPos.x = MinX;
        }
        transform.position = TempPos;

        
    }
}//class
