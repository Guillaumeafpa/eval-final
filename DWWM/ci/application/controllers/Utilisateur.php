<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Utilisateur extends CI_Controller
{
   public function accueil()
   {
      // Chargement de l'assistant 'url'
      $this->load->helper('url');

      // Appel des vues
      $this->load->view('header');
      $this->load->view('accueil');
      $this->load->view('footer');
   }
   public function formulaire()
   {
      // Chargement de l'assistant 'url'
      $this->load->helper('url');
      $this->load->helper('form');

      // Appel des vues
      $this->load->view('header');
      $this->load->view('formulaire');
      $this->load->view('footer');
   }
}