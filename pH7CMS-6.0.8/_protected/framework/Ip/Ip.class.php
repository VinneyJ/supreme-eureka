<?php
/**
 * @title            Ip Class
 * @desc             Helper for the IP Class.
 *
 * @author           Pierre-Henry Soria <hello@ph7cms.com>
 * @copyright        (c) 2012-2017, Pierre-Henry Soria. All Rights Reserved.
 * @license          GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
 * @package          PH7 / Framework / Ip
 * @version          1.2
 */

namespace PH7\Framework\Ip;
defined('PH7') or exit('Restricted access');

use PH7\Framework\Server\Server, PH7\Framework\Mvc\Model\DbConfig;

class Ip
{
    /**
     * Get IP address.
     *
     * @param string $sIp Allows to speciy another IP address than the client one.
     *
     * @return string IP address. If the IP format is invalid, returns '0.0.0.0'
     */
    public static function get($sIp = null)
    {
        if (empty($sIp)) {
            $sIp = static::getClientIp();
        }

        if (static::isPrivate($sIp))
            $sIp = '127.0.0.1'; // Avoid invalid local IP for GeoIp

        return preg_match('/^[a-z0-9:.]{7,}$/', $sIp) ? $sIp : '127.0.0.1';
    }

    /**
     * Returns the API IP with the IP address.
     *
     * @param string $sIp IP address. Allows to speciy a specific IP.
     *
     * @return string API URL with the IP address.
     */
    public static function api($sIp = null)
    {
        $sIp = (empty($sIp)) ? static::get() : $sIp;
        return DbConfig::getSetting('ipApi') . $sIp;
    }

    /**
     * Check if it's a local machine IP or not.
     *
     * @param string $sIp The IP address.
     *
     * @return boolean Returns TRUE is it's a private IP, FALSE otherwite.
     */
    public static function isPrivate($sIp)
    {
        return filter_var($sIp, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 | FILTER_FLAG_IPV6 | FILTER_FLAG_NO_PRIV_RANGE |  FILTER_FLAG_NO_RES_RANGE) ? false : true;
    }

    /**
     * @return string Client IP address.
     */
    private static function getClientIp()
    {
        $sIp = ''; // Default IP address value.

        $aVars = [Server::HTTP_CLIENT_IP, Server::HTTP_X_FORWARDED_FOR, Server::REMOTE_ADDR];
        foreach ($aVars as $sVar) {
            if (null !== Server::getVar($sVar)) {
                $sIp = Server::getVar($sVar);
                break;
            }
        }
        unset($aVars);

        return $sIp;
    }
}
