<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Models\Product;
use App\Models\ProductMaterial;
use App\Models\ProductType;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all();
        // расчет стоимости одного продукта на основе материалов
        $cost = [];
        foreach ($products as $product) {
            // инициализация стоимости для продукта с id = $product->id
            $cost[$product->id] = 0;

            $productMaterial = ProductMaterial::where('product_id', $product->id)->get();
            foreach ($productMaterial as $material) {
                if (isset($material->material)) {
                    $cost[$product->id] += $material->quantity * $material->material->price;
                }
            }
            // округление до двух знаков после запятой
            $cost[$product->id] = round($cost[$product->id], 2);
        }
        return view('products.index', compact('products', 'cost'));
    }
    public function create() {
        // получение всех типов продуктов
        $product_types = ProductType::all();
        return view('products.create', compact('product_types'));
    }
    public function store(ProductRequest $request) {
        // создание продукта
        Product::create($request->validated());
        // перенаправление обратно с сообщением об успехе
        return redirect()->route('products.index')->with('success', 'Продукт успешно добавлен');
    }
    public function show(Product $product) {
        // загрузка продуктов с информацией о кол-ве материала
        $materials = $product->productMaterials()
            ->with('material')
            ->get();
        return view('products.show', compact('product', 'materials'));
    }
    public function edit(Product $product) {
        // получение всех типов продуктов
        $product_types = ProductType::all();
        return view('products.edit', compact('product', 'product_types'));
    }
    public function update(ProductRequest $request, Product $product) {
        // обновляем продукт
        $product->update($request->validated());
        // перенаправляем на страницу списка продуктов с сообщением об успехе
        return redirect()->route('products.index')->with('success', 'Продукт успешно обновлен');
    }
}
