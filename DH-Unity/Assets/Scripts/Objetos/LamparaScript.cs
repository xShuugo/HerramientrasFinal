using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LamparaScript : MonoBehaviour {

	public float LongitudCable;
	public float RangoLuz;
	public string EnchufeActual;

	[SerializeField]
	private bool On = false;
	Light ThisLight;
	GameObject Enchufe;
	
	void Start () {
		ThisLight = transform.Find("LightSource").
			GetComponent<Light>();
		ThisLight.range=RangoLuz*10;
	}
	
	
	void Update () {
		if(Enchufe==null && GameObject.Find(EnchufeActual)!=null){
			Enchufe = GameObject.Find(EnchufeActual);
		}

		if(Enchufe != null) On=true;
		else On=false;

		if(On)ThisLight.enabled=true;
		else ThisLight.enabled=false;
	}
}
