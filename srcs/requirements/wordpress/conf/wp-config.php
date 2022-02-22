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
define( 'DB_NAME', 'wordpress_db' );
// define( 'DB_NAME', getenv('MYSQL_DATABASE') );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'user42' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'lvirgini42' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'mariadb' );

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
define( 'AUTH_KEY',         'nKRi`~|oHF`=Q+M:t+n2]1`<z]m~GYeXdl,;_JRLtzE/`Q5F`%h0L#h=;9YAM5,k' );
define( 'SECURE_AUTH_KEY',  'I?v0y*iO02Ud*/pZ{7 J.s5e?(/!yT?.{CQ|^;Z23 K7iB<g,H-FO):JLvm9Kv`M' );
define( 'LOGGED_IN_KEY',    'KKFU4>3G$?M0#jiUJ+Ox~#~S=/#dKaz(i,t^Hs8f1<M,!tv?Y6:eGc}129bx~0Q{' );
define( 'NONCE_KEY',        '?qKDPyK,81o|PLX~(<5 RTk>E8vtqm/OBdZky+i,x[}(0q^<~VK,Bghks`?<>S^1' );
define( 'AUTH_SALT',        '%l4#`jUZ@0 H>23q~qPkO}Daks#N^yHbBcy5&YHhsW#B0l:M:}au-Cj}FuTINMl&' );
define( 'SECURE_AUTH_SALT', '%Eq 7iwP2.>3E<wO`pEWwf{J9_9j>?x$_S/tJ3s~=Ge32.<-mrM0c:@WzVq]^J|y' );
define( 'LOGGED_IN_SALT',   'hVJl-k+Y-u[X6-8b`+vw>E-WySvk6;{3IO-(Qalw8<q4I2cr(u.y/O64!7#t/`}y' );
define( 'NONCE_SALT',       'xn2.b`5[o{|dE$2/N,I:[Fh){n0qeb.j]MWPA;co`(sn8z9R~8xEZ[<SS>|qgc@F' );
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
