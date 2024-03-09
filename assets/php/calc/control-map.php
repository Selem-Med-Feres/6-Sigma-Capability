<?php

/**
 * analyse_Xmap
 * Interprétation des cartes de contrôles des moyenne
 *
 * @param float $LSC Limite supérieure de contrôle
 * @param float $X Cible (Moyenne des moyennes)
 * @param float $LIC Limite inférieure de contrôle
 * @param string $points Chaîne de caractères contenant les moyennes de chaque échantillon séparées par " - " 
 *
 * @return array Observation | Description | Décision
 */

function analyse_Xmap(float $LSC, float $X, float $LIC, string $points)
{
    $centralThird = array($LIC + (($LSC - $LIC) / 3), $LIC + ((($LSC - $LIC) / 3) * 2));
    $bottomSixth = array($LIC, $LIC + (($LSC - $LIC) / 6));
    $topSixth = array($LSC - (($LSC - $LIC) / 6), $LSC);
    $ptsInCentralThird = 0;

    // calculer le nombre de point dans le tiers interieur de la carte
    for ($i = 0; $i < sizeof(explode(" - ", $points)); $i++) {
        if ((explode(" - ", $points)[$i] > $centralThird[0]) && (explode(" - ", $points)[$i] < $centralThird[1])) {
            $ptsInCentralThird += 1;
        }
    }

    // Point hors limite superieure 
    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] > $LSC)) {
        return array(
            'Point hors limites',
            'Le dernier point tracé a franchi la limite supérieure de contrôle.',
            '<span>Régler le procédé</span> de ' . round(explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] - $X, 5, PHP_ROUND_HALF_UP) . ' et re-vérifier.'
        );
    }

    // Point hors limite inferieure 
    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] < $LIC)) {
        return array(
            'Point hors limites',
            'Le dernier point tracé a franchi la limite inférieure de contrôle.',
            '<span>Régler le procédé</span> de ' . round($X - explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1], 5, PHP_ROUND_HALF_UP) . ' et re-vérifier.'
        );
    }

    // Tendance Superieure 
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceSup = 0;
        $adjust = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 8); $i--) {
            if ((explode(" - ", $points)[$i] > $X)) {
                $tendanceSup += 1;
                $adjust += (explode(" - ", $points)[$i] - $X);
            }
        }
        if ($tendanceSup == 7) {
            return array(
                'Tendance supérieure',
                '7 points consécutifs sont supérieurs à la moyenne.',
                '<span>Régler le procédé</span> de ' . round($adjust / 7, 5, PHP_ROUND_HALF_UP) . ' et re-vérifier.'
            );
        }
    }

    // Tendance Inferieure 
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceInf = 0;
        $adjust = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 8); $i--) {
            if ((explode(" - ", $points)[$i] < $X)) {
                $tendanceInf += 1;
                $adjust += ($X - explode(" - ", $points)[$i]);
            }
        }
        if ($tendanceInf == 7) {
            return array(
                'Tendance inférieure',
                '7 points consécutifs sont inférieurs à la moyenne.',
                '<span>Régler le procédé</span> de ' . round($adjust / 7, 5, PHP_ROUND_HALF_UP) . ' et re-vérifier.'
            );
        }
    }

    // Tendance croissante
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceCroissante = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 7); $i--) {
            if ((explode(" - ", $points)[$i] > explode(" - ", $points)[($i - 1)])) {
                $tendanceCroissante += 1;
            }
        }
        if ($tendanceCroissante == 6) {
            return array(
                'Tendance croissante',
                '7 points consécutifs sont en augmentation régulière.',
                '<span>Régler le procédé</span> de ' . round(explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] - $X, 5, PHP_ROUND_HALF_UP) . ' et re-vérifier.'
            );
        }
    }

    // Tendance décroissante
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceDecroissante = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 7); $i--) {
            if ((explode(" - ", $points)[$i] < explode(" - ", $points)[($i - 1)])) {
                $tendanceDecroissante += 1;
            }
        }
        if ($tendanceDecroissante == 6) {
            return array(
                'Tendance décroissante',
                '7 points consécutifs sont en diminution régulière.',
                '<span>Régler le procédé</span> de ' . round($X - explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1], 5, PHP_ROUND_HALF_UP) . ' et re-vérifier.'
            );
        }
    }

    // Un point proche des limites 
    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] < $topSixth[0])
        && (explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] > $topSixth[1])
    ) {
        return array(
            '1 point proche des limites',
            'Le dernier point tracé se situe dans le 1/6 au bord supérieur de la carte de contrôle.',
            '<span>Confirmer</span> en prélevant immédiatement un autre échantillon :
            <br><br> • Si le point revient dans le tiers central &#8594; <span>Production</span> 
            <br><br> • Si le point est également proche ou en dehors des limites &#8594; Régler de la valeur moyenne des deux points.'
        );
    }

    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] < $bottomSixth[0])
        && (explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] > $bottomSixth[1])
    ) {
        return array(
            '1 point proche des limites',
            'Le dernier point tracé se situe dans le 1/6 au bord inférieur de la carte de contrôle.',
            '<span>Confirmer</span> en prélevant immédiatement un autre échantillon :
            <br><br> • Si le point revient dans le tiers central &#8594; <span>Production</span> 
            <br><br> • Si le point est également proche ou en dehors des limites &#8594; Régler de la valeur moyenne des deux points.'
        );
    }

    if ($ptsInCentralThird >= ((sizeof(explode(" - ", $points)) * 2) / 3)) {
        return array(
            'Procédé sous contrôle',
            '• La courbe X&#772; oscille de chaque coté de la moyenne.
        <br><br> • 2/3 des points sont dans le tiers central de la carte.',
            '<span>Production</span>'
        );
    }
}

/**
 * analyse_Emap
 * Interprétation des cartes de contrôles des étendues
 *
 * @param float $LSC Limite supérieure de contrôle
 * @param float $X Cible (Moyenne des étendues)
 * @param float $LIC Limite inférieure de contrôle
 * @param string $points Chaîne de caractères contenant les étendues de chaque échantillon séparées par " - " 
 *
 * @return array Observation | Description | Décision
 */

function analyse_Emap(float $LSC, float $X, float $LIC, string $points)
{
    $centralThird = array($LIC + (($LSC - $LIC) / 3), $LIC + ((($LSC - $LIC) / 3) * 2));
    $bottomSixth = array($LIC, $LIC + (($LSC - $LIC) / 6));
    $topSixth = array($LSC - (($LSC - $LIC) / 6), $LSC);
    $ptsInCentralThird = 0;

    // calculer le nombre de point dans le tiers interieur de la carte
    for ($i = 0; $i < sizeof(explode(" - ", $points)); $i++) {
        if ((explode(" - ", $points)[$i] > $centralThird[0]) && (explode(" - ", $points)[$i] < $centralThird[1])) {
            $ptsInCentralThird += 1;
        }
    }

    // Point hors limite superieure 
    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] > $LSC)) {
        return array(
            'Point hors limites',
            'Le dernier point tracé a franchi la limite supérieure de contrôle.',
            '• La capabilité de la machine se détériorie. Il faut trouver l\'origine de cette détérioration et intervenir.
            <br><br> • Il y a une erreur de mesure.'
        );
    }

    // Point hors limite inferieure 
    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] < $LIC)) {
        return array(
            'Point hors limites',
            'Le dernier point tracé a franchi la limite inférieure de contrôle.',
            '• La capabilité de la machine s\'améliore.
            <br><br> • Le système de mesure est bloqué.'
        );
    }

    // Tendance Superieure 
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceSup = 0;
        $adjust = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 8); $i--) {
            if ((explode(" - ", $points)[$i] > $X)) {
                $tendanceSup += 1;
                $adjust += (explode(" - ", $points)[$i] - $X);
            }
        }
        if ($tendanceSup == 7) {
            return array(
                'Tendance supérieure',
                '7 points consécutifs sont supérieurs à la moyenne.',
                'La capabilité de la machine se détériorie. Il faut trouver l\'origine de cette détérioration et intervenir.'
            );
        }
    }

    // Tendance Inferieure 
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceInf = 0;
        $adjust = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 8); $i--) {
            if ((explode(" - ", $points)[$i] < $X)) {
                $tendanceInf += 1;
                $adjust += ($X - explode(" - ", $points)[$i]);
            }
        }
        if ($tendanceInf == 7) {
            return array(
                'Tendance inférieure',
                '7 points consécutifs sont inférieurs à la moyenne.',
                'La capabilité de la machine s\'améliore. Il faut trouver l\'origine de cette amélioration pour la maintenir.'
            );
        }
    }

    // Tendance croissante
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceCroissante = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 7); $i--) {
            if ((explode(" - ", $points)[$i] > explode(" - ", $points)[($i - 1)])) {
                $tendanceCroissante += 1;
            }
        }
        if ($tendanceCroissante == 6) {
            return array(
                'Tendance croissante',
                '7 points consécutifs sont en augmentation régulière.',
                'La capabilité de la machine se détériorie. Il faut trouver l\'origine de cette détérioration et intervenir.'
            );
        }
    }

    // Tendance décroissante
    if (sizeof(explode(" - ", $points)) > 6) {
        $tendanceDecroissante = 0;
        for ($i = (sizeof(explode(" - ", $points)) - 1); $i > (sizeof(explode(" - ", $points)) - 7); $i--) {
            if ((explode(" - ", $points)[$i] < explode(" - ", $points)[($i - 1)])) {
                $tendanceDecroissante += 1;
            }
        }
        if ($tendanceDecroissante == 6) {
            return array(
                'Tendance décroissante',
                '7 points consécutifs sont en diminution régulière.',
                'La capabilité de la machine s\'améliore. Il faut trouver l\'origine de cette amélioration pour la maintenir.'
            );
        }
    }

    // Un point proche des limites 
    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] < $topSixth[0])
        && (explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] > $topSixth[1])
    ) {
        return array(
            '1 point proche des limites',
            'Le dernier point tracé se situe dans le 1/6 au bord supérieur de la carte de contrôle.',
            '<span>Surveiller la capabilité :</span>
            <br><br>Si plusieurs points de la carte sont également proches de la limite supérieure, la capabilité se détériorie.
            Il faut trouver l\'origine de cette détérioration et intervenir.'
        );
    }

    if ((explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] < $bottomSixth[0])
        && (explode(" - ", $points)[sizeof(explode(" - ", $points)) - 1] > $bottomSixth[1])
    ) {
        return array(
            '1 point proche des limites',
            'Le dernier point tracé se situe dans le 1/6 au bord inférieur de la carte de contrôle.',
            ' - '
        );
    }

    if ($ptsInCentralThird >= ((sizeof(explode(" - ", $points)) * 2) / 3)) {
        return array(
            'Procédé sous contrôle',
            '• La courbe X&#772; oscille de chaque coté de la moyenne.
        <br><br> • 2/3 des points sont dans le tiers central de la carte.',
        '<span>Production</span>'
        );
    }    
}
