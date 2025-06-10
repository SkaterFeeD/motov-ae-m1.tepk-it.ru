@extends('layouts.layout')

@section('title', 'Редактировать продукт')

@section('content')
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Редактировать продукт</h1>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('products.update', $product) }}" method="POST">
            @csrf
            <div class="mb-2">
                <label for="product_type_id" class="form-label">Тип продукта</label>
                <select name="product_type_id" id="product_type_id" class="form-control" required>
                    @foreach ($product_types as $type)
                        <option value="{{ $type->id }}" {{ $type->id == $product->product_type_id ? 'selected' : '' }}>
                            {{ $type->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="mb-2">
                <label for="name" class="form-label">Наименование</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ old('name', $product->name) }}" required>
                @error('name')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-2">
                <label for="article" class="form-label">Артикул</label>
                <input type="text" name="article" id="article" class="form-control" value="{{ old('article', $product->article) }}" required>
                @error('article')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-2">
                <label for="minPrice" class="form-label">Минимальная стоимость для партнера (₽)</label>
                <input type="number" step="0.01" name="minPrice" id="minPrice" class="form-control"
                       value="{{ old('minPrice', $product->minPrice) }}" required>
                @error('minPrice')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-2">
                <label for="width" class="form-label">Ширина (м)</label>
                <input type="number" step="0.01" name="width" id="width" class="form-control"
                       value="{{ old('width', $product->width) }}" required>
                @error('width')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
            <div class="text-center mt-3">
                <button type="submit" class="btn me-2">Сохранить изменения</button>
                <a href="{{ route('products.index') }}" class="btn">Назад </a>
            </div>
        </form>
    </div>
@endsection
