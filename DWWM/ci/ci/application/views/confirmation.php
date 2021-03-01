
<div class="row m-0" id="color">
   <div class="card offset-4 col-4">
      <ul class="list-group list-group-flush">
         <?= form_open('',"class='col-12 form'");?>
            <img src='<?php echo base_url("assets/images/".$produit->pro_id.".".$produit->pro_photo);?>' class="card-img-top responsive image">

            <?= form_hidden('id', 'nain_porte_quoi'); ?>

            <li class="align-middle text-center"><strong>Référence : </strong><?= $produit->pro_ref;?></li>
            <li class="align-middle text-center"><strong>Libellé : </strong><?= $produit->pro_libelle;?></li>
            <li class="align-middle text-center"><strong>Prix : </strong><?= $produit->pro_prix;?></li>
            <li class="align-middle text-center"><strong>Couleur : </strong><?= $produit->pro_couleur;?></li>
            <li class="align-middle text-center"><strong>Date d'ajout : </strong><?= $produit->pro_d_ajout;?></li><br>

            <h4 class="align-middle text-center">Validez-vous la suppession du produit ?</h4>
            <?= '<div class="btn-block"><br>';
            echo form_submit('','Suprimer','class=" btn btn-outline-success btn-block"');

          echo '</div>';?>
         </form>
      </ul>
      </div>
   </div>
</div>
