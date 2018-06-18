using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MapSpawner : MonoBehaviour
{
    [Header("File Reading")]
    public TextAsset LevelFile;

    [Header("Objects")]
    public GameObject Lampara;
    public GameObject Mesa;
    public GameObject Pared;
    public GameObject CajaF;
    public GameObject Llave;
    public GameObject Nota;
    public GameObject Enchufe;
    public GameObject Fosforos;
    public GameObject Puerta;
    void Start()
    {
        ReadFile();
    }

    void ReadFile()
    {
        string[] arg = LevelFile.ToString().Split('/');

        GameObject.Find("LevelTitle").GetComponent<Text>().text = arg[0];

        string[] PPos = arg[1].Split('|');
        GameObject.Find("Player").transform.position = new Vector3(
            float.Parse(PPos[0]),float.Parse(PPos[1]),float.Parse(PPos[2]));

        for (int a = 2; a < arg.Length - 1; a++)
        {
            Debug.Log(arg[a]);
            string[] prop = arg[a].Split('|');
            //Debug.Log(prop[0]);
            switch (prop[0].Trim())
            {
                case "Mesa": SpawnMesa(prop); break;
                default: Debug.Log("Tipo no declarado"); break;
            }
        }
    }

    void SpawnMesa(string[] p)
    {
        GameObject m = Instantiate(Mesa,
		 new Vector3(float.Parse(p[2]), 0, float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		m.name = p[1];
    }
}
