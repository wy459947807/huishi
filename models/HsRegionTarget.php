<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "hs_region_target".
 *
 * @property integer $id
 * @property string $regionname
 * @property string $zonename
 * @property integer $target
 * @property string $target_month
 * @property string $sign
 */
class HsRegionTarget extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'hs_region_target';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['regionname'], 'required'],
            [['target'], 'integer'],
            [['target_month'], 'safe'],
            [['regionname', 'zonename', 'sign'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'regionname' => 'Regionname',
            'zonename' => 'Zonename',
            'target' => 'Target',
            'target_month' => 'Target Month',
            'sign' => 'Sign',
        ];
    }
}
