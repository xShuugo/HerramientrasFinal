using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouseLocker : MonoBehaviour {

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        // Lock/Unlock
        if (Cursor.lockState == CursorLockMode.Locked)
        {
            if (Input.GetButtonUp("Cancel"))
            { Cursor.lockState = CursorLockMode.None; Debug.Log("yep"); }
        }
        else
        {
            if ((Input.GetButtonUp("Fire1") || Input.GetButtonUp("Cancel")))
                Cursor.lockState = CursorLockMode.Locked;
        }
       

        // Hide/Unhide
        if (Cursor.lockState == CursorLockMode.Locked)
            Cursor.visible = false;
        else Cursor.visible = true;
    }
}
