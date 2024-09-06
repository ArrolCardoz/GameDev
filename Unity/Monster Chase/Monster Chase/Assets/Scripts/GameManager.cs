using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public static GameManager instance;
    [SerializeField]
    private GameObject[] player;

    private int _playerIndex;
    public int PlayerIndex
    {
        get{return _playerIndex ; }
        set{_playerIndex = value;}
    }


    void Awake()
    {
        if(instance == null){
                instance = this;
                DontDestroyOnLoad(gameObject);
          }
          else{
              Destroy(gameObject);
          
        }
        
    }

    private void OnEnable() {
        SceneManager.sceneLoaded += OnLevelFinishedLoading;
    }

    private void OnDisable() {
        SceneManager.sceneLoaded -= OnLevelFinishedLoading;
    }

    void OnLevelFinishedLoading(Scene scene, LoadSceneMode mode){
        if(scene.name == "Gameplay"){
            Instantiate(player[PlayerIndex]);
        }

    }
}//class
