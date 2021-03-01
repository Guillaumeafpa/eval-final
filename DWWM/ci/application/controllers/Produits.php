<?php
// application/controllers/Produits.php

defined('BASEPATH') OR exit('No direct script access allowed');

class Produits extends CI_Controller 
{   

   public function tableau()
   {
      // Chargement de l'assistant 'url'
      $this->load->helper('url');

      // Chargement du modèle 'produitsModel'
      $this->load->model('produitsModel');

      // Récupération des résultats du model
      $aListe = $this->produitsModel->tableau();

      // Ajoute des résultats de la requête au tableau des variables àtransmettre à  la vue   
      $aView["liste_produits"] = $aListe;

      // Appel de la vue avec transmission du tableau
      $this->load->view('header');
      $this->load->view('tableau', $aView);
      $this->load->view('footer');
   }

   public function delete($id)
   {
      // Chargement de l'assistant 'url'
      $this->load->helper('url');
      $this->load->helper('form');
      
      // Chargement du modèle 'produitsModel'
      $this->load->model('ProduitsModel');

      // Exécute la requête 
      $results = $this->ProduitsModel->produit($id);

      // Ajoute des résultats de la requête au tableau des variables à transmettre à la vue
      $aView["produit"] = $results;


      if ($this->input->post())
      {
         $aListe = $this->ProduitsModel->delete($id);
         redirect("produits/tableau");
      }
      else
      {
         // Chargement des views
         $this->load->view('header');
         $this->load->view('confirmation', $aView);
         $this->load->view('footer');
      }
   }

   public function ajouter()
   {
      // Chargement des assistants 'form' et 'url'
      $this->load->helper(['form','url']);
      $this->load->library('form_validation'); 
      $this->load->model('ProduitsModel');

      //chargement des categories
      $categories = $this->ProduitsModel->categorie();
      $aCat = array();
      foreach ($categories as $row)
      {
         $aCat[$row->cat_id] = $row->cat_nom;
      }


      if ($this->input->post()) 
      { // 2ème appel de la page: traitement du formulaire

         $data = $this->input->post();

         // Définition des filtres, ici une valeur doit avoir été saisie pour le champ 'pro_ref'
         $this->form_validation->set_rules('Référence', 'Référence', 'required|regex_match[/^[a-z,A-Z-_0-9,àáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{1,10}$/]', array("required" => "La %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         $this->form_validation->set_rules("Catégorie", "Catégorie", "required|regex_match[/^[0-9]{1,10}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         $this->form_validation->set_rules("Libellé", "Libellé", "required|regex_match[/^[a-z,A-Z, ,-,0-9,àáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{1,200}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         $this->form_validation->set_rules("Description", "Description", "required|regex_match[/^[a-z,A-Z,;,.,\', ,-,0-9,-,àáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{1,1000}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         $this->form_validation->set_rules("Prix", "Prix", "required|regex_match[/^[0-9]{1,6}([,.]{1}[0-9]{0,2}){0,1}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         $this->form_validation->set_rules("Stock", "Stock", "required|regex_match[/^[-0-9]{1,11}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         $this->form_validation->set_rules("Couleur", "Couleur", "required|regex_match[/^[a-zA-Z]{1,30}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

         if ($this->form_validation->run() == FALSE)
         { // Echec de la validation, on réaffiche la vue formulaire 
            $this->load->view('header');
            $this->load->view('ajouter' ,array("aCat" => $aCat));
            $this->load->view('footer');
         }
         else
         { // La validation a réussi, nos valeurs sont bonnes, on peut insérer en base

            date_default_timezone_set("Europe/Paris");
            $date = (new DateTime())->format('Y-m-d');

            if($this->input->post('Produit_bloqué') == 0)
            {
              $bloque = null;
            }
            else
            {
              $bloque = 1;
            }

            $data = array(
               "pro_ref"=>$this->input->post('Référence'),
               "pro_cat_id"=>$this->input->post('Catégorie'),
               "pro_libelle"=>$this->input->post('Libellé'),
               "pro_description"=>$this->input->post('Description'),
               "pro_prix"=>$this->input->post('Prix'),
               "pro_stock"=>$this->input->post('Stock'),
               "pro_couleur"=>$this->input->post('Couleur'),
               "pro_d_ajout"=>$date,
               "pro_bloque"=>$bloque
            );
            $insertion = $this->ProduitsModel->insertion($data);
            redirect("produits/tableau");
         }
      }
      else 
      { // 1er appel de la page: affichage du formulaire
         $this->load->view('header');
         $this->load->view('ajouter', array("aCat" => $aCat));
         $this->load->view('footer');
      }
   }

   public function modifier($id)
   {
      // Chargement des assistants 'form' et 'url'
      $this->load->helper(['form','url']);
      $this->load->library('form_validation');
      $this->load->model('ProduitsModel');

      //chargement des categories
      $categories = $this->ProduitsModel->categorie();
      $aCat = array();
      foreach ($categories as $row)
      {
         $aCat[$row->cat_id] = $row->cat_nom;
      }
      $aView["aCat"] = $aCat;

      // Exécute la requête
      $produit = $this->ProduitsModel->produit($id);

      // Ajoute des résultats de la requête au tableau des variables à transmettre à la vue   
      $aView["produit"] = $produit;

      if ($this->input->post()) 
      { // 2ème appel de la page: traitement du formulaire

      // Définition des filtres
      $this->form_validation->set_rules('Référence', 'Référence', 'required|regex_match[/^[a-z,A-Z-_0-9,àáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{1,10}$/]', array("required" => "La %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      $this->form_validation->set_rules("Catégorie", "Catégorie", "required|regex_match[/^[0-9]{1,10}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      $this->form_validation->set_rules("Libellé", "Libellé", "required|regex_match[/^[a-z,A-Z, ,-,0-9,àáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{1,200}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      $this->form_validation->set_rules("Description", "Description", "required|regex_match[/^[a-z,A-Z,;,.,\', ,-,0-9,-,àáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{1,1000}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      $this->form_validation->set_rules("Prix", "Prix", "required|regex_match[/^[0-9]{1,6}([,.]{1}[0-9]{0,2}){0,1}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      $this->form_validation->set_rules("Stock", "Stock", "required|regex_match[/^[-0-9]{1,11}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      $this->form_validation->set_rules("Couleur", "Couleur", "required|regex_match[/^[a-zA-Z]{1,30}$/]", array("required" => "Le %s doit être obligatoire.","regex_match" => "La %s est incorrect"));

      if ($this->form_validation->run() == FALSE)
      { // Echec de la validation, on réaffiche la vue formulaire 
         $this->load->view('header');              
         $this->load->view('modifier', $aView);
         $this->load->view('footer');
      }
      else
      { // La validation a réussi, nos valeurs sont bonnes, on peut modifier en base  

         /* Utilisation de la méthode where() toujours 
         * avant select(), insert() ou update()
         * dans cette configuration sur plusieurs lignes 
         */
         date_default_timezone_set("Europe/Paris");
         $date = (new DateTime())->format('Y-m-d H:i:s');

         if($this->input->post('Produit_bloqué') == 0)
         {
           $bloque = null;
         }
         else
         {
           $bloque = 1;
         }

         $data = array(
            "pro_ref"=>$this->input->post('Référence'),
            "pro_cat_id"=>$this->input->post('Catégorie'),
            "pro_libelle"=>$this->input->post('Libellé'),
            "pro_description"=>$this->input->post('Description'),
            "pro_prix"=>$this->input->post('Prix'),
            "pro_stock"=>$this->input->post('Stock'),
            "pro_couleur"=>$this->input->post('Couleur'),
            "pro_d_modif"=>$date,
            "pro_bloque"=>$bloque
         );

         $this->ProduitsModel->modifier($data, $id);
         redirect("produits/tableau");
      }
      } 
      else 
      { // 1er appel de la page: affichage du formulaire
         $this->load->view('header');              
         $this->load->view('modifier', $aView);
         $this->load->view('footer');
      }   
   }
}
?>