<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'root' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', '' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost:3308' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'G-72MQ8HzY;~F(Xm~Cc%hznU;T#f8AK?wa*ehnlT!Yfq(~7/lVc)qO9v]egak[S=' );
define( 'SECURE_AUTH_KEY',  '=qdF5%f6Ie}=u TUz,O<a90sMO(A2n#&43s eA2*aC{7fIt~VQ>$TTU?@!H`YQ&A' );
define( 'LOGGED_IN_KEY',    ']q-no/hV].l0ISsW_]4Fp&hh<T(e4K00H%mFy!e#sOiaSYNX{X&g2ne1v%nt<#Kv' );
define( 'NONCE_KEY',        '0f}KDovw>Z6TrMuw}Y${HneZ%R2yiwDZ4]:In&QBPr^uON|R;x;nV7UYI)OX#l%n' );
define( 'AUTH_SALT',        'YZatONf1zwI?IJab`/1*bcOn1=m)K2yuB$g|oWwJ.y,jjk7(Nf79S+*t49J14ND]' );
define( 'SECURE_AUTH_SALT', '=YQjv*VRzGXlad*6zIr}4t5`xUSAQ=j_m!MJLc5&dTAJBh J?6TE?O2ec,OZqUd1' );
define( 'LOGGED_IN_SALT',   'O@eiW_7>;97a~s~ZEs[Fom-{&W&xocp&M*< h<qdIoix9y${39MD%Tp+<U*9CQ0D' );
define( 'NONCE_SALT',       '~t|yI#bh03fpD8=PAvAgg`c`K>y=XxYh3Vy?y<5lkO5=|<@zSK|W?Or/p9@$qAxe' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
