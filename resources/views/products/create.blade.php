@extends('layouts.layout')

@section('title', 'Добавить продукт')

@section('content')
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Добавить новый продукт</h1>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('products.store') }}" method="POST">
            @csrf

            <div class="mb-3">
                <label for="product_type_id" class="form-label">Тип продукта</label>
                <select name="product_type_id" id="product_type_id" class="form-control" required>
                    <option value="">Выберите тип продукта</option>
                    @foreach ($product_types as $type)
                        <option value="{{ $type->id }}">{{ $type->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">Наименование</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="article" class="form-label">Артикул</label>
                <input type="text" name="article" id="article" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="minPrice" class="form-label">Минимальная стоимость для партнера (₽)</label>
                <input type="number" step="0.01" name="minPrice" id="minPrice" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="width" class="form-label">Ширина (м)</label>
                <input type="number" step="0.01" name="width" id="width" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn me-2">Сохранить</button>
                <a href="{{ route('products.index') }}" class="btn">Назад</a>
            </div>
        </form>
    </div>
@endsection
