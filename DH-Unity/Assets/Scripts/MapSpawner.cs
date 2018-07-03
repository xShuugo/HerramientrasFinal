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
    public GameObject Nota;
    public GameObject Enchufe;
    public GameObject Fosforos;
    public GameObject PuertaF;
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
            //Debug.Log(arg[a]);
            string[] prop = arg[a].Split('|');
            //Debug.Log(prop[0]);
            switch (prop[0].Trim())
            {
                case "Mesa": SpawnMesa(prop); break;
                case "Lampara": SpawnLampara(prop);break;
                case "Pared": SpawnPared(prop); break;
                case "Enchufe": SpawnEnchufe(prop); break;
                case "Fosforos": SpawnFosforos(prop); break;
                case "Cajafuerte": SpawnCajaF(prop); break;
                case "Nota": SpawnNota(prop); break;
                case "PuertaF": SpawnPuertaF(prop); break;
                default: Debug.Log("Tipo no declarado"); break;
            }
        }
    }

    void SpawnMesa(string[] p)
    {
        GameObject m = Instantiate(Mesa,
		 new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		m.name = p[1];
    }

    void SpawnLampara(string[] p)
    {
        GameObject l = Instantiate(Lampara,
		    new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		    Quaternion.Euler(0, float.Parse(p[4]), 0));
		l.name = p[1];

        l.GetComponent<LamparaScript>().LongitudCable = float.Parse(p[5]);
        l.GetComponent<LamparaScript>().RangoLuz = float.Parse(p[6]);
        l.GetComponent<LamparaScript>().EnchufeActual = p[8].Trim();

        if(p[7].Trim() == "true"){
            GameObject m = Instantiate(Mesa,
		        new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
                Quaternion.Euler(0, float.Parse(p[4]), 0));
            m.name = p[1]+"-mesa";

            l.transform.position = new Vector3(
                l.transform.position.x,
                l.transform.position.y+.8f,
                l.transform.position.z);
        }
    }

    void SpawnPared(string[] p)
    {
        GameObject pr = Instantiate(Pared,
		 new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		pr.name = p[1];
    }

    void SpawnFosforos(string[] p)
    {
        GameObject f = Instantiate(Fosforos,
		 new Vector3(float.Parse(p[2]), 1, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		f.name = p[1];
        f.GetComponent<FosforoScript>().Cantidad = int.Parse(p[5]);
    }

    void SpawnCajaF(string[] p)
    {
        GameObject cf = Instantiate(CajaF,
		 new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		cf.name = p[1];
        cf.GetComponent<CajaFScript>().Password=p[5].Trim();
        cf.GetComponent<CajaFScript>().ContenidoName=p[6].Trim();

        if(p[7].Trim() == "true"){
            GameObject m = Instantiate(Mesa,
		        new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
                Quaternion.Euler(0, float.Parse(p[4]), 0));
            m.name = p[1]+"-mesa";

            cf.transform.position = new Vector3(
                cf.transform.position.x,
                cf.transform.position.y+.8f,
                cf.transform.position.z);
        }
    }

    void SpawnNota(string[] p){
        GameObject n = Instantiate(Nota,
		 new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		n.name = p[1];
        n.GetComponent<NotaScript>().Contenido = p[5];
    }

    void SpawnEnchufe(string[] p){
        GameObject e = Instantiate(Enchufe,
		 new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		e.name = p[1];
    }

    void SpawnPuertaF(string[] p)
    {
        GameObject pf = Instantiate(PuertaF,
		 new Vector3(float.Parse(p[2]), 0, -float.Parse(p[3])),
		 Quaternion.Euler(0, float.Parse(p[4]), 0));
		pf.name = p[1];
    }
}
