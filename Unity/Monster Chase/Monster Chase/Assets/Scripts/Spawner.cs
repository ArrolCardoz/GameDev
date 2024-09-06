using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spawner : MonoBehaviour
{
    [SerializeField]
    private GameObject[] monsterReference;
    private GameObject spawnMonster;
    [SerializeField]
    private Transform leftPos, rightPos;

    private int RandomIndex;
    private int RandomSide;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(SpawnMonster()) ;
        
    }

    IEnumerator SpawnMonster(){
        while(true)
        {
         yield return new WaitForSeconds(Random.Range(1,5));
         RandomIndex = Random.Range(0,monsterReference.Length);
         RandomSide = Random.Range(0,2);

         spawnMonster = Instantiate(monsterReference[RandomIndex]);

         if(RandomSide == 0 ){
            //left side
            spawnMonster.transform.position = leftPos.position;
            spawnMonster.GetComponent<Enemy>().speed = Random.Range(4,10);

        }
        else{
            //right side
            spawnMonster.transform.position = rightPos.position;
            spawnMonster.GetComponent<Enemy>().speed = -Random.Range(4,10);
            spawnMonster.transform.localScale =new Vector3 (-1f,1f,1f);
        }
    
        }
    
    }


    
}//class
