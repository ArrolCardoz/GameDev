using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UI_Controller : MonoBehaviour
{
    public void RestartButton(){
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
    public void HomeButton(){
        SceneManager.LoadScene("Main Menu");
    }
}
