<?php 
if (!defined('BASEPATH')) exit('No direct script access allowed');

class ProduitsModel extends CI_Model
{
    public function tableau()
    {
        $this->load->database();
        $requete = $this->db->query("SELECT * FROM produits");
        $aProduits = $requete->result();
        return $aProduits;
    }// -- tableau()

    public function produit($id)
    {
        $this->load->database();
        $results = $this->db->query("SELECT * FROM produits WHERE pro_id= ?", $id)->row();
        return $results;
    }// -- produit($id)

    public function delete($id)
    {
        //delete d'un produit
        $this->load->database();
        $this->db->where('pro_id', $id);
        $this->db->delete("produits");
        /* on peut mettre un return dans la fnction delete pour vérifier que celle-ci ce soit bien éxecuter car la requête renvoie true en cas de réussite et false en cas d'échec. */
    }// -- delete($id)

    public function categorie()
    {
        $this->load->database();
        $categories = $this->db->query('SELECT * FROM categories')->result();
        return $categories;
    }// -- categorie

    public function insertion($data)
    {
        $this->load->database();
        $verif = $this->db->insert('produits', $data);
        return $verif;
    }// -- insertion($data)

    public function modifier()
    {
        $this->load->database();
        
    }// -- modifier()
}