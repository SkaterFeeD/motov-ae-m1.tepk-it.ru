<?php

namespace App\Http\Controllers;

use App\Models\MaterialType;
use App\Models\ProductType;
use Illuminate\Http\Request;

class FuncController extends Controller
{
    /**
     * рассчитывает необходимое количество материала для производства продукции
     *
     * @param ProductType $productTypeId ID типа продукции
     * @param MaterialType $materialTypeId ID типа материала
     * @param int $productCount количество продукции
     * @param float $param1 первый параметр продукции
     * @param float $param2 второй параметр продукции
     * @param float $stockQuantity количество материала на складе
     * @return int целое количество закупаемого материала или -1 при ошибках
     */
    public function calculateRequiredMaterial(ProductType $productTypeId, MaterialType $materialTypeId, int $productCount, float $param1, float $param2, float $stockQuantity): int {
        try {
            // проверка входных значений

            if ($productCount <= 0 || $param1 <= 0 || $param2 <= 0 || $stockQuantity < 0)
            {
                return -1;
            }

            // получаем данные продукции

            $productType = ProductType::findOrFail($productTypeId);
            if (!$productType instanceof ProductType)
            {
                return -1;
            }

            // получаем данные материала

            $materialType = MaterialType::findOrFail($materialTypeId);
            if (!$materialType instanceof MaterialType)
            {
                return -1;
            }

            // коэффициент типа продукции

            $coefficient = $productType->coefficient;

            // процент брака

            $defectPercent = $materialType->defect;

            // расчет кол-ва без брака

            $requiredMaterial = $param1 * $param2 * $coefficient * $productCount;

            // учет брака, увеличиваем на процент дефектов

            $totalWithDefect = $requiredMaterial * (1 + $defectPercent / 100);

            // расчет недостающего кол-ва

            $neededMaterial = max(0, ceil($totalWithDefect - $stockQuantity));
            return $neededMaterial;
        } catch (Exception $e)
        {
            // обработка ошибок
            return -1;
        }
    }
}
