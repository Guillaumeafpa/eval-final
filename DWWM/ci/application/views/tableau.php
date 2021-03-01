

    <div><br><br>
        <a href='<?= site_url("produits/ajouter") ?>' title="lien vers le formulaire d'ajout">
            <button type="submit" class="col-12 btn bg-secondary text-white p-3"><strong>ajouter un produit</strong>
            </button>
        </a><br>
    <br>
    </div>

    <div class="card-columns">
    <?php
        foreach ($liste_produits as $row) 
        {
        ?>
        <div class="card">
            
            <ul class="list-group list-group-flush">
                <a href="<?= site_url('produits/modifier/'.$row->pro_id);?>">
                    <img src='<?php echo base_url("assets/images/".$row->pro_id.".".$row->pro_photo);?>' class="card-img-top responsive image">
                </a>
                    <li class="align-middle text-center"><strong>Référence : </strong><?= $row->pro_ref;?></li>
                    <li class="align-middle text-center"><strong>Libellé : </strong><?= $row->pro_libelle;?></li>
                    <li class="align-middle text-center"><strong>Prix : </strong><?= $row->pro_prix;?></li>
                    <li class="align-middle text-center"><strong>Couleur : </strong><?= $row->pro_couleur;?></li>
                    <li class="align-middle text-center"><strong>Date d'ajout : </strong><?= $row->pro_d_ajout;?></li>
                </ul>
                
                <div class="card-body align-middle text-center">
                    <a href="<?= site_url('produits/delete/'.$row->pro_id);?>">
                        <button class="btn btn-outline-danger">Suprimer</button>
                    </a>
                    <a href="<?= site_url('produits/modifier/'.$row->pro_id);?>">
                        <button class="btn btn-outline-warning">Modifier</button>
                    </a>
                    <a>
                        <button class="btn btn-outline-info">Panier</button>
                    </a>
                </div>
            </div>
        
        <?php
        }
        ?>
    </div>