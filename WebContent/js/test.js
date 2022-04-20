/**
 * 
 */
  $(document).ready(function(){
        $('#selection').change(function(){
           libelle = this.value;
  
           if (libelle == 'Deplacement') {
           
            $('#nom_restau').hide();
            $('#1nom_restau').hide();
            $('#name_salle').hide();
            $('#1name_salle').hide();
            $('#date_restaut').hide();
            $('#1date_restaut').hide();
            $('#ville_restau').hide();
            $('#1ville_restau').hide();
            $('#prix_nuit').hide();
            $('#1prix_nuit').hide();
            $('#repas').hide();
            $('#1repas').hide();
            $('#1nbr_jours').hide();
            $('#nbr_jours').hide();
            
            $('#lieu_depart').show();
            $('#1lieu_depart').show();
            $('#lieu_arriver').show();
            $('#1lieu_arriver').show();
            $('#trajet_fait').show();
            $('#1trajet_fait').show();
            $('#date_debut').show();
            $('#1date_debut').show();
            $('#date_fin').show();
            $('#1date_fin').show();
           }

           if (libelle =='Hotel') {
            $('#nbr_jours').hide();
            $('#lieu_depart').hide();
            $('#1lieu_depart').hide();
            $('#lieu_arriver').hide();
            $('#1lieu_arriver').hide();
            $('#trajet_fait').hide();
            $('#1trajet_fait').hide();
            $('#nom_restau').hide();
            $('#1nom_restau').hide();
            $('#date_restaut').hide();
            $('#1date_restaut').hide();
            

            $('#ville_restau').show();
            $('#1ville_restau').show();
            $('#name_salle').show();
            $('#1name_salle').show();
            $('#nbr_jours').show();
            $('#1nbr_jours').show();
            $('#prix_nuit').show();
            $('#1prix_nuit').show();
            $('#repas').show();
            $('#1repas').show();
            $('#date_debut').show();
            $('#1date_debut').show();
            $('#date_fin').show();
            $('#1date_fin').show();

           }

           if (libelle == 'Diner avec un particulier') {
            $('#nbr_jours').hide();
            $('#lieu_depart').hide();
            $('#1lieu_depart').hide();
            $('#lieu_arriver').hide();
            $('#1lieu_arriver').hide();
            $('#trajet_fait').hide();
            $('#1trajet_fait').hide();
            $('#name_salle').hide();
            $('#1name_salle').hide();
            $('#prix_nuit').hide();
            $('#1prix_nuit').hide();
            $('#repas').hide();
            $('#1repas').hide();
            $('#1nbr_jours').hide();
            $('#nbr_jours').hide();
            $('#date_debut').hide();
            $('#1date_debut').hide();
            $('#date_fin').hide();
            $('#1date_fin').hide();

            $('#nom_restau').show();
            $('#1nom_restau').show();
            $('#ville_restau').show();
            $('#1ville_restau').show();
            $('#date_restaut').show();
            $('#1date_restaut').show();
           }
           if (libelle == 'Location de salle') {
            $('#nbr_jours').hide();
            $('#lieu_depart').hide();
            $('#1lieu_depart').hide();
            $('#lieu_arriver').hide();
            $('#1lieu_arriver').hide();
            $('#trajet_fait').hide();
            $('#1trajet_fait').hide();
            $('#nom_restau').hide();
            $('#1nom_restau').hide();
            $('#date_restaut').hide();
            $('#1date_restaut').hide();
            $('#prix_nuit').hide();
            $('#1prix_nuit').hide();
            $('#repas').hide();
            $('#1repas').hide();
            

            $('#ville_restau').show();
            $('#1ville_restau').show();
            $('#name_salle').show();
            $('#1name_salle').show();
            $('#nbr_jours').show();
            $('#1nbr_jours').show();
            $('#date_debut').show();
            $('#1date_debut').show();
            $('#date_fin').show();
            $('#1date_fin').show();
           }

        });
      });
