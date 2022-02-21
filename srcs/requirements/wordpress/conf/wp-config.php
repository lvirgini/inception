<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
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


define( 'DB_COLLATE', '' );
// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME',  getenv('MYSQL_DATABASE') );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', getenv('MYSQL_USER') );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', getenv('MYSQL_USER_PASSWORD') );

/** Adresse de l’hébergement MySQL. */
// define( 'DB_HOST', 'mariadb' );
// define( 'DB_HOST', '0.0.0.0:mariadb' );
// define( 'DB_HOST', '127.0.0.1:3306' );
// define( 'DB_HOST', 'localhost:3306' );
// define( 'DB_HOST', 'localhost' );
// define( 'DB_HOST', '0.0.0.0' );
define( 'DB_HOST', '0.0.0.0:3306' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

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

define('AUTH_KEY',         'uMH7YY3h8J{J`FdtFu P-<V a)*xw![)?I@_6}XUgEf?{c`;]q8:.S+&=T@zDKA$');
define('SECURE_AUTH_KEY',  'myhK+-JJVC|8GOQ}Rc-4d|++kMc_qNoY99:I!ZJpx?LX)j+dpA1P}*O9c(ufGi)E');
define('LOGGED_IN_KEY',    'RH76^pfsr:`EZ YdEsc)$tUx)ArC$8KXVPR!V2m;}VNCB9aWh|/e>:BN^ ~Y%2+i');
define('NONCE_KEY',        'XjSr,EmjC(|)56|:*h~E!ze3G<E4q#~ftGK>x*v=dbK<M=[17]#&d{{Q4<|%7o G');
define('AUTH_SALT',        '@8M,zr.U9_X`~6Lo@6gKod3hjQ8@G/MWej:v6+oOL]m0Hg`|u@%nEg;/-3MmL_jF');
define('SECURE_AUTH_SALT', 'sfD4?+|n;G))TF&3js-V]6( v`<,4$l|g,Iz_Ge}.jfGm*F+m6c#v^N5RAby/tg:');
define('LOGGED_IN_SALT',   'La F#<Z>+g^_Ven;pJ:GZ quh7D1PB-ya@E aE^9q|IzS-/;K-?=8f*v&DPyIQ z');
define('NONCE_SALT',       'vSW?WBI_!uB+3X-!*y-Zp~|)G>HqFvZka $;zn;w H4zw)8oEuD+NP@4Lut*+hFJ');

/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
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
