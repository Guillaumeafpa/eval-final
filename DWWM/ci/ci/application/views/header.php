<!DOCTYPE html>

<html lang="fr">
   <head>
 	   <meta charset="utf-8">
 	   <meta name="viewport" content="width=device-width, initial-scale=1,   shrink-to-fit=no">
      <link rel="stylesheet" type="text/css" href="<?= base_url("assets/css/style.css");?>">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  	   <link href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" rel="stylesheet" crossorigin="anonymous">
      <title>Jarditou.com</title>
   </head>

   <?PHP
   /* réglage de la date */
   //----------------------------------------------
   date_default_timezone_set("Europe/Paris");
   setlocale (LC_TIME, 'fr_FR.utf8','fra');
   //----------------------------------------------
   ?>

   <body id="bg">

      <style>
      #bg{
      background-image: url(<?php echo base_url("assets/images/background.jpg");?>);
      background-attachment: fixed;
      background-size: cover;
      }

      .image{
        max-height : 380px;
      }
      </style>


   <div class="container">
      <div class="row d-none d-lg-flex align-items-center">

         <!-- Logo du site -->
         <div class="col-sm-12 col-lg-3">
            <a href="<?= site_url('produits/tableau/');?>" title="JardiTou"><img class="img-fluid" src="<?php echo base_url("assets/images/logo.jpg");?>" alt="Logo JardiTou"></a>
         </div>

      <div class="d-sm-none d-lg-block col-lg-4"></div>


      <!-- Slogan du site -->
      <div class="col-sm-12 col-lg-5">
         <h1 class="text-center">tout le jardin</h1>
      </div>


      </div>
      <div classs="row">
         <nav class="navbar navbar-expand-lg navbar-light bg-light">

            <!-- date de visite -->
            <a class="navbar-brand" href="#"><?php echo (strftime("%A %d %B")); ?></a>

            <!-- structure de la barre de navigation -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>



            <!-- contenu de la barre de navigation -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                     <a class="nav-link" href="">Accueil</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="<?=site_url("produits/tableau")?>">Tableau</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="">Contact</a>
                  </li>


                  <!-- contenu du modal d'inscription -->
                  <li class="nav-item">
                     <div class="modal fade" id="modal_inscription" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="staticBackdropLabel">Inscription</h5>
                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <form action="session_inscription_script.php" method="POST">
                                 <div class="modal-body">

                                    <div class="form-group">
                                       <label for="nom">nom</label>
                                       <input type="text" name="nom" class="form-control">
                                    </div>

                                    <div class="form-group">
                                       <label for="prenom">prenom</label>
                                       <input type="text" name="prenom"  class="form-control">
                                    </div>

                                    <div class="form-group">
                                       <label for="mail">e-mail</label>
                                       <input type="text" name="mail" class="form-control">
                                    </div>

                                    <div class="form-group">
                                       <label for="loin">login</label>
                                       <input type="text" name="login" class="form-control">
                                    </div>

                                    <div class="form-group">
                                       <label for="mdp">mot de passe</label>
                                       <input type="password" name="mdp" class="form-control">
                                    </div>

                                    <div class="form-group">
                                       <label for="remdp">confirmation du mot de passe</label>
                                       <input type="password" name="remdp" class="form-control">
                                    </div>

                                 </div>
                                 <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">Retour</button>
                                    <button type="submit" class="btn btn-primary">Envoyer</button>
                                 </div>
                              </form>
                           </div>
                        </div>
                     </div>
                  </li>


                  <!-- contenu du modal de connexion -->
                  <li class="nav-item">
                     <div class="modal fade" id="modal_connexion" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h5 class="modal-title" id="staticBackdropLabel">Connexion</h5>
                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <form action="session_connect_script.php" method="POST">
                                 <div class="modal-body">

                                    <div class="form-group">
                                        <label for="loin">login</label>
                                        <input type="text" name="login" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label for="mdp">mot de passe</label>
                                        <input type="password" name="mdp" class="form-control">
                                    </div>

                                 </div>
                                 <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">Retour</button>
                                    <button type="submit" class="btn btn-primary">Envoyer</button>
                                 </div>
                              </form>
                           </div>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>

            <button type="button" class="btn btn-outline-primary my-2 my-sm-0" data-toggle="modal" data-target="#modal_inscription"><strong> inscription </strong></button>

         </nav>
      </div>
      
      <img src='<?php echo base_url("assets/images/promotion.jpg");?>' title="promotion a ne pas manquer" class="img-fluid" alt="Responsive image">
          