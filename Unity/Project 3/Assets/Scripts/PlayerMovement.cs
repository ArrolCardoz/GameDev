
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    private Animator Anime;
    private Rigidbody2D Body;
    private BoxCollider2D boxCollider;
    [SerializeField]
    private LayerMask groundLayer;
    [SerializeField]
    private LayerMask wallLayer;
    [SerializeField]
    private float BodySpeed;
    [SerializeField]
    private float JumpForce;
    

    private void Awake() {
        Body = GetComponent<Rigidbody2D>();
        Anime = GetComponent<Animator>();
        boxCollider = GetComponent<BoxCollider2D>();

    }

    private void Update() {
        float InputHorizontal = Input.GetAxisRaw("Horizontal");
        Body.velocity = new Vector2(InputHorizontal* BodySpeed , Body.velocity.y);

        //flip Character


        if(InputHorizontal > 0)
        {
            //Player is moving right
            transform.localScale = Vector3.one;
        }
        else if (InputHorizontal <0)
        {
            //Player is moving left
            transform.localScale = new Vector3(-1,1,1);
        }
        
        //Jump


        if(Input.GetKey(KeyCode.Space) && isGrounded())
            Jump();
        

        //Animation
        Anime.SetBool("Run", InputHorizontal != 0);
        Anime.SetBool("grounded", isGrounded());

       
        
    }

    private void Jump (){
        Body.velocity = new Vector2(Body.velocity.x , JumpForce);
        Anime.SetTrigger("jump");


    }

    private void OnCollisionEnter2D(Collision2D collision) {        
    }


    private bool isGrounded() {
        RaycastHit2D raycastHit = Physics2D.BoxCast(boxCollider.bounds.center,boxCollider.bounds.size,0, Vector2.down,0.1f,groundLayer);
        return raycastHit.collider != null;
    }

    private bool onWall()
    {
        RaycastHit2D raycastHit = Physics2D.BoxCast(boxCollider.bounds.center, boxCollider.bounds.size, 0,new Vector2(transform.localScale.x,0),0.1f, wallLayer);
        return raycastHit.collider != null;

    }
    


   
}
