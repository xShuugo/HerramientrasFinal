using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour {

    public float Acceleration = 5f;
    public int VelocityLimit;
    float translation;
    float straffe;
    Rigidbody rb;

    private void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    private void Update () {
        if (Cursor.lockState == CursorLockMode.Locked)
        {
            translation = Input.GetAxisRaw("Vertical") * Acceleration;
            straffe = Input.GetAxisRaw("Horizontal") * Acceleration;
            translation *= Time.deltaTime;
            straffe *= Time.deltaTime;
        }
        

    }
    private void FixedUpdate()
    {
        //Velocidad aplicada al rigidb
        rb.velocity += transform.forward * translation;
        rb.velocity += transform.right * straffe;

        //Limite de velocidad horizontal
        Vector2 xz = new Vector2(rb.velocity.x,rb.velocity.z);
        xz = Vector2.ClampMagnitude(xz, VelocityLimit);
        rb.velocity = new Vector3(xz.x, rb.velocity.y, xz.y);
        

    }

    //private void LateUpdate()
    //{
    //    Debug.Log(rb.velocity);

    //}
}
