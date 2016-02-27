module CodesHelper

  # Add links to articles and legal references
  def ajout_liens(data, date)
    # data = texte à parser
    # date = date désirée des textes en vigueur
    # Format YYYYMMDD (ex. : &dateTexte=20131202)
    # Cf. https://fr.wikipedia.org/wiki/Application_de_la_loi_dans_le_temps_en_droit_fran%C3%A7ais


    # id LEGITEXT des codes
    # Attention ’ vs ''
    codes_legifrance = {
      "LEGITEXT000006074069" => ["code de l’action sociale et des familles"],
      "LEGITEXT000006075116" => ["code de l’artisanat"],
      "LEGITEXT000006073984" => ["code des assurances"],
      "LEGITEXT000006074234" => ["code de l’aviation civile"],
      "LEGITEXT000006071646" => ["code du blé"],
      "LEGITEXT000006073422" => ["code des caisses d’épargne"],
      "LEGITEXT000020908868" => ["code du cinéma et de l’image animée"],
      "LEGITEXT000006070721" => ["code civil"],
      "LEGITEXT000005634379" => ["code de commerce"],
      "LEGITEXT000006069441" => ["code de commerce (ancien)"],
      # Attention ordre, plus long d'abord
      "LEGITEXT000006070300" => ["code des communes de la Nouvelle-Calédonie"],
      "LEGITEXT000006070162" => ["code des communes"],
      # Attention ordre
      "LEGITEXT000006069472" => ["code de la consommation des boissons et des mesures contre l’alcoolisme applicable dans la collectivité territoriale de mayotte"],
      "LEGITEXT000006069565" => ["code de la consommation"],
      "LEGITEXT000006074096" => ["code de la construction et de l’habitation"],
      "LEGITEXT000006075115" => ["code des débits de boissons et des mesures contre l’alcoolisme"],
      "LEGITEXT000006071307" => ["code de la défense"],
      "LEGITEXT000006071071" => ["code de déontologie de la police nationale"],
      "LEGITEXT000006071103" => ["code de déontologie de la profession de commissaire aux comptes"],
      "LEGITEXT000006070159" => ["code de déontologie des agents de police municipale"],
      "LEGITEXT000006074232" => ["code de déontologie des architectes"],
      "LEGITEXT000006072636" => ["code de déontologie des chirurgiens-dentistes"],
      "LEGITEXT000006072664" => ["code de déontologie des médecins"],
      "LEGITEXT000006074510" => ["code de déontologie des professionnels de l’expertise comptable"],
      "LEGITEXT000006072635" => ["code de déontologie des sages-femmes"],
      "LEGITEXT000006072634" => ["code de déontologie médicale"],
      "LEGITEXT000006072360" => ["code de déontologie vétérinaire"],
      "LEGITEXT000006071188" => ["code disciplinaire et pénal de la marine marchande"],
      "LEGITEXT000006070208" => ["code du domaine de l’état"],
      "LEGITEXT000006074235" => ["code du domaine de l’état et des collectivités publiques applicable à la collectivité territoriale de mayotte"],
      "LEGITEXT000006074237" => ["code du domaine public fluvial et de la navigation intérieure"],
      "LEGITEXT000006071570" => ["code des douanes"],
      "LEGITEXT000006071645" => ["code des douanes de Mayotte"],
      "LEGITEXT000006071191" => ["code de l’éducation"],
      "LEGITEXT000006070239" => ["code électoral"],
      "LEGITEXT000023983208" => ["code de l’énergie"],
      "LEGITEXT000006071014" => ["code de l’enseignement technique"],
      "LEGITEXT000006070158" => ["code de l’entrée et du séjour des étrangers et du droit d’asile"],
      "LEGITEXT000006074220" => ["code de l’environnement"],
      "LEGITEXT000006074224" => ["code de l’expropriation pour cause d’utilité publique"],
      "LEGITEXT000006072637" => ["code de la famille et de l’aide sociale"],
      "LEGITEXT000006071514" => ["code forestier"],
      "LEGITEXT000025244092" => ["code forestier (nouveau)"],
      "LEGITEXT000006071556" => ["code forestier de mayotte"],
      "LEGITEXT000006070299" => ["code général de la propriété des personnes publiques"],
      "LEGITEXT000006070633" => ["code général des collectivités territoriales"],
      # Attention ordre
      "LEGITEXT000006069577" => ["code général des impôts, code des impôts"],
      "LEGITEXT000006069568" => ["code général des impôts, annexe 1"],
      "LEGITEXT000006069569" => ["code général des impôts, annexe 2"],
      "LEGITEXT000006069574" => ["code général des impôts, annexe 3"],
      "LEGITEXT000006069576" => ["code général des impôts, annexe 4"],
      "LEGITEXT000006070882" => ["code de l’industrie cinématographique"],
      "LEGITEXT000006070666" => ["code des instruments monétaires et des médailles"],
      "LEGITEXT000006070249" => ["code des juridictions financières"],
      "LEGITEXT000006070933" => ["code de justice administrative"],
      "LEGITEXT000006070884" => ["code de justice militaire"],
      "LEGITEXT000006071360" => ["code de justice militaire (nouveau)"],
      "LEGITEXT000006071007" => ["code de la légion d’honneur et de la médaille militaire"],
      "LEGITEXT000006069583" => ["livre des procédures fiscales"],
      # Attention ordre
      "LEGITEXT000006069562" => ["code des marchés publics (édition 1964)"],
      "LEGITEXT000006069564" => ["code des marchés publics (édition 2001)"],
      "LEGITEXT000006072666" => ["code des marchés publics (édition 2004)"],
      "LEGITEXT000005627819" => ["code des marchés publics (édition 2006)"],
      "LEGITEXT000006071785" => ["code minier"],
      "LEGITEXT000023501962" => ["code minier (nouveau)"],
      "LEGITEXT000006072026" => ["code monétaire et financier"],
      "LEGITEXT000006074067" => ["code de la mutualité"],
      "LEGITEXT000006071189" => ["code de la nationalité"],
      "LEGITEXT000006071737" => ["code de l’office national interprofessionnel du blé"],
      "LEGITEXT000006071164" => ["code de l’organisation judiciaire"],
      "LEGITEXT000006074236" => ["code du patrimoine"],
      "LEGITEXT000006070719" => ["code pénal"],
      "LEGITEXT000006071029" => ["code pénal (ancien)"],
      "LEGITEXT000006070302" => ["code des pensions civiles et militaires de retraite"],
      "LEGITEXT000006074066" => ["code des pensions de retraite des marins français du commerce, de pêche ou de plaisance"],
      "LEGITEXT000006074068" => ["code des pensions militaires d’invalidité et des victimes de guerre"],
      "LEGITEXT000006074068" => ["code des pensions militaires d’invalidité et des victimes de la guerre"],
      "LEGITEXT000006074233" => ["code des ports maritimes"],
      "LEGITEXT000006070987" => ["code des postes et des communications électroniques"],
      "LEGITEXT000006070716" => ["code de procédure civile"],
      "LEGITEXT000006070680" => ["code de procédure civile (1807)"],
      "LEGITEXT000006071154" => ["code de procédure pénale"],
      "LEGITEXT000025024948" => ["code des procédures civiles d’exécution"],
      "LEGITEXT000006069414" => ["code de la propriété intellectuelle"],
      "LEGITEXT000006071190" => ["code de la recherche"],
      "LEGITEXT000031366350" => ["code des relations entre le public et l’administration"],
      "LEGITEXT000006074228" => ["code de la route"],
      "LEGITEXT000006074947" => ["code de la route (ancien)"],
      "LEGITEXT000006071366" => ["code rural (ancien)"],
      "LEGITEXT000006071367" => ["code rural et de la pêche maritime"],
      "LEGITEXT000006072665" => ["code de la santé publique"],
      "LEGITEXT000025503132" => ["code de la sécurité intérieure"],
      "LEGITEXT000006073189" => ["code de la sécurité sociale"],
      "LEGITEXT000006071335" => ["code du service national"],
      "LEGITEXT000006071318" => ["code du sport"],
      "LEGITEXT000006074073" => ["code du tourisme"],
      "LEGITEXT000023086525" => ["code des transports"],
      "LEGITEXT000006072050" => ["code du travail"],
      "LEGITEXT000006072052" => ["code du travail applicable à mayotte"],
      "LEGITEXT000006072051" => ["code du travail maritime"],
      "LEGITEXT000006071344" => ["code des tribunaux administratifs"],
      "LEGITEXT000006074075" => ["code de l’urbanisme"],
      "LEGITEXT000006071657" => ["code du vin"],
      "LEGITEXT000006070667" => ["code de la voirie routière"]
    }

    # Erreurs / à rajouter
    # Codes de la Nouvelle-Calédonie : http://www.juridoc.gouv.nc/JuriDoc/JdWebE.nsf/Juristart?openpage JURITEXT000030445981
    # Codes de la Polynésie française : http://textes.assemblee.pf/internetdoc/texte/delib/1966-80.pdf

    analyzed_data = ''
    non_analyzed_data = data
    # REGEX to find the first match of the pattern in the whole text
    ref = non_analyzed_data.match(/ le ([cC]ode (\ ?[[:alpha:]])+)/)

    # Loop, until there's nothing to find
    while ref != nil
      # Boolean
      found = 0

      # [cC]ode (\ ?[[:alpha:]])+
      nom_code_trouve = ref[1]
      # Downcase and strip to compare to the codes_legifrance hash
      nom_code_trouve_downcase = nom_code_trouve.downcase.strip
      # Début de la string
      debut = ref.begin(0)
      # Fin de la string
      fin = ref.end(0)
      # Longueur totale
      longueur_total = non_analyzed_data.length

      lien = ''

      # Loop over Legifrance names and ids
      # Could be improved...
      # Faster method with a tree?
      codes_legifrance.each do |legi_id, noms_complets|
        noms_complets.each do |nom_complet|
          if nom_code_trouve_downcase.start_with?(nom_complet)
            # if nom_code_trouve_downcase.start_with?(*noms_complets)
            # Passer l'array en argument avec * splat
            # https://stackoverflow.com/questions/16258975/how-to-pass-an-array-as-an-argument-list
            lien = ' le <a href="https://www.legifrance.gouv.fr/affichCode.do?cidTexte=' + legi_id + '+&dateTexte=' + date + '" target="_blank">' + nom_code_trouve + '</a>'
            # Data to analyze = end of the text
            analyzed_data += non_analyzed_data[0...debut] + lien
            non_analyzed_data = non_analyzed_data[fin...longueur_total]
            found = 1
            break
          end
        end
        # Stop to loop over the hash if a correct code has been found
        if found == 1
          break
        end
      end

      # If the code wasn't in our list
      if found == 0
        analyzed_data += non_analyzed_data[0...fin]
        non_analyzed_data = non_analyzed_data[fin...longueur_total]
      end

      # Look for new matches only if there's still something to analyze
      if non_analyzed_data != '' and non_analyzed_data != nil
        ref = non_analyzed_data.match(/ le ([cC]ode (\ ?[[:alpha:]])+)/)
      else
        ref = nil
      end
    end

    data = analyzed_data + non_analyzed_data

    return data
  end

end