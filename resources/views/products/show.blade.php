@extends('layouts.layout')

@section('title', 'Просмотр продукта. Материалы для ' . $product->name)

@section('content')
    <div class="container mt-5">
        <h2 class="mb-4 text-center">Просмотр продукта</h2>
        <h2 class="mb-4 text-center">Материалы для "{{ $product->name }}"</h2>

        @if ($product->productMaterials->isEmpty())
            <div class="alert alert-info">Нет назначенных материалов.</div>
        @else
            <table class="table text-center table-striped table-bordered">
                <thead class="table-color h3">
                <tr>
                    <th>Наименование материала</th>
                    <th>Количество</th>
                </tr>
                </thead>
                <tbody class="table-color">
                @foreach ($product->productMaterials as $pm)
                    <tr>
                        <td>{{ $pm->material->name }}</td>
                        <td>{{ number_format($pm->quantity, 2) }} {{ optional($pm->material->unit)->name }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        @endif
        <div class="text-center">
            <a href="{{ route('products.index') }}" class="btn">Назад к продуктам</a>
        </div>
    </div>
@endsection
