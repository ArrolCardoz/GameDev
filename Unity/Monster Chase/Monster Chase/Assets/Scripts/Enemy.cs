using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    [SerializeField]
    public float speed ;
    private Rigidbody2D myBody;
    // Start is called before the first frame update
    private void Awake()
    {
       myBody = GetComponent<Rigidbody2D>(); 

    }

    // Update is called once per frame
    void FixedUpdate()
    {
        myBody.velocity = new   Vector2(speed, myBody.velocity.y);

        
    }
}
