<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::get('/products', [\App\Http\Controllers\ProductController::class, 'index'])->name('products.index');
Route::get('/products/create', [\App\Http\Controllers\ProductController::class, 'create'])->name('products.create');
Route::post('/products/create', [\App\Http\Controllers\ProductController::class, 'store'])->name('products.store');
Route::get('/products/{product}', [\App\Http\Controllers\ProductController::class, 'show'])->name('products.show');
Route::get('/products/{product}/edit', [\App\Http\Controllers\ProductController::class, 'edit'])->name('products.edit');
Route::post('/products/{product}/edit', [\App\Http\Controllers\ProductController::class, 'update'])->name('products.update');

