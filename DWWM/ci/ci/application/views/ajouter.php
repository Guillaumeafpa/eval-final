
      

        <br>
        <?php echo form_open('',"class='col-12 form ' need-validation");  
          

          echo '<div class="form-group"><br>';
            echo form_label('Référence', 'Référence');
            echo form_input('Référence', set_value('Référence') ,'class="form-control col-12 " id="Référence" required');
            echo form_error('Référence');
          echo '</div>';


          echo '<div class="form-group"><br>';
            echo form_label('Catégorie', 'Catégorie');
            echo form_dropdown('Catégorie', $aCat,set_value('Catégorie'),'class="form-control col-12 required" id="Catégorie"');
            echo form_error('Catégorie');
          echo '</div>';


          echo '<div class="form-group"><br>';
            echo form_label('Libellé', 'Libellé');
            echo form_input('Libellé', set_value('Libellé') ,'class="form-control col-12" id="Libellé" required');
            echo form_error('Libellé');
          echo '</div>';


          echo '<div class="form-group"><br>';
            echo form_label('Description', 'Description');
            echo form_textarea('Description',set_value('Description'),'class="form-control col-12" id="Description"');
            echo form_error('Description');
          echo '</div>';


          echo '<div class="form-group"><br>';
            echo form_label('Prix', 'Prix');
            echo form_input('Prix', set_value('Prix') ,'class="form-control col-12" id="Prix" required');
            echo form_error('Prix');
          echo '</div>';


          echo '<div class="form-group"><br>';
            echo form_label('Stock', 'Stock');
            echo form_input('Stock', set_value('Stock') ,'class="form-control col-12" id="Stock" required');
            echo form_error('Stock');
          echo '</div>';


          echo '<div class="form-group"><br>';
            echo form_label('Couleur', 'Couleur');
            echo form_input('Couleur', set_value('Couleur') ,'class="form-control col-12" id="Couleur" required');
            echo form_error('Couleur');
          echo '</div>';


        echo '<div class="form-group"><br>';
            echo form_label('Produit_bloqué', 'pro_bloque').'<br>';
                $data = array(
                    'name'          => 'Produit_bloqué',
                    'id'            => 'pro_bloque',
                    'value'         => '1',
                    'checked'       => False,
                );
            echo form_radio($data).'oui'.'<br>';
                $data = array(
                    'name'          => 'Produit_bloqué',
                    'id'            => 'pro_bloque',
                    'value'         => '0',
                   'checked'       => False,
                );
            echo form_radio($data).'non';
            echo form_error('Produit_bloqué');
        echo '</div>';



          echo '<div class="btn-block"><br>';
            echo form_submit('','valider','class=" btn btn-outline-success btn-block"');
            echo form_reset('','Annuler','class="btn btn-outline-danger btn-block"');
          echo '</div>';
        ?>

        </form>
      </div>

