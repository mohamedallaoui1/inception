<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'mallaoui' );

/** Database password */
define( 'DB_PASSWORD', '123' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '81Ow<Y=LejzC/8s9faH3_E@Bf?`H;<ZBx0 Dqo)b:7XdRt[M?C(?<F)_14%ks[sq' );
define( 'SECURE_AUTH_KEY',   ')l2EwpA&xn`%MDCQ`U){qMKI+J/o(d``R0~7;w*!qiq;MXIFwAtE2d7JxUjtz]r`' );
define( 'LOGGED_IN_KEY',     '^;5KQ]M2h}n@a<=2iy`Y@^##5]~Efc4LtAUymu&1kZGG]7+/fzLZ$Rd97s@axR{~' );
define( 'NONCE_KEY',         '[#US@S>bjj~9J;jDm!g`y_cZutGR!)-dP*A x|a|e:6]LfKrtpUipX`>obv1T?8e' );
define( 'AUTH_SALT',         '}YRJ{`(%!r.(S?69Uss,Zwq-RAAQ,3UNQ$a~U{$7G2/kIV4&=]0wI2G`jl&^_R}|' );
define( 'SECURE_AUTH_SALT',  'HFUtg7~c&w{J7]IkP1`#Tb?CNp*d[7uB[t!;d}X{.BoZ;65?05kN3ZWyBn!Z8_!D' );
define( 'LOGGED_IN_SALT',    'toST:xq+#iQpc9mDd{[WbYujL:KlUew)sB>vzjq4*;Ti8w5bFq&STgeB9o--x:!4' );
define( 'NONCE_SALT',        'Qmt}(N:wl!!Mi$3^J,.h]JbJ8mt(4n><O,m/QtAz%e1dmyV4h5T%w#OMb;+av<Yh' );
define( 'WP_CACHE_KEY_SALT', 'lQL%:p+%l~D~xH7<wB>v>+W%O%>5W`HLUOdEVVjX_u4+aobtF^BRN@]Qg6u9rc3?' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */

define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_CACHE', true);


/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
