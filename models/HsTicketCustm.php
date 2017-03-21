<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "hs_ticket_custm".
 *
 * @property integer $id
 * @property string $ticket
 * @property string $brand
 * @property integer $buynum
 * @property string $storecode
 * @property string $storename
 * @property string $zonename
 * @property string $regionname
 * @property string $physicalcity
 * @property string $custmtype
 * @property string $custmname
 * @property string $signdate
 * @property string $lng
 * @property string $lat
 * @property string $sign
 */
class HsTicketCustm extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'hs_ticket_custm';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['buynum'], 'integer'],
            [['signdate'], 'safe'],
            [['ticket', 'brand', 'storecode', 'storename', 'zonename', 'regionname', 'physicalcity', 'custmtype', 'custmname', 'lng', 'lat', 'sign'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ticket' => 'Ticket',
            'brand' => 'Brand',
            'buynum' => 'Buynum',
            'storecode' => 'Storecode',
            'storename' => 'Storename',
            'zonename' => 'Zonename',
            'regionname' => 'Regionname',
            'physicalcity' => 'Physicalcity',
            'custmtype' => 'Custmtype',
            'custmname' => 'Custmname',
            'signdate' => 'Signdate',
            'lng' => 'Lng',
            'lat' => 'Lat',
            'sign' => 'Sign',
        ];
    }
}
