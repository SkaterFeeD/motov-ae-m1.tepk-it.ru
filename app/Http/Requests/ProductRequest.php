<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'product_type_id' => 'required|exists:product_types,id',
            'name' => 'required|string|max:255',
            'article' => 'required|string|max:255',
            'minPrice' => 'required|numeric|min:0',
            'width' => 'required|numeric|min:0',
        ];
    }
    public function messages() {
        return [
            'product_type_id.required' => 'Поле "Тип продукта" обязательно для заполнения',
            'product_type_id.exists' => 'Указанный тип продукта не существует',
            'name.required' => 'Поле "Наименование" обязательно для заполнения',
            'name.string' => 'Поле "Наименование" должно быть строкой',
            'name.max' => 'Поле "Наименование" не должно превышать 255 символов',
            'article.required' => 'Поле "Артикул" обязательно для заполнения',
            'article.string' => 'Поле "Артикул" должно быть строкой',
            'minPrice.required' => 'Поле "Минимальная стоимость" обязательно для заполнения',
            'minPrice.numeric' => 'Поле "Минимальная стоимость" должно быть числом',
            'minPrice.min' => 'Поле "Минимальная стоимость" не может быть отрицательным',
            'width.required' => 'Поле "Ширина" обязательно для заполнения',
            'width.numeric' => 'Поле "Ширина" должно быть числом',
            'width.min' => 'Поле "Ширина" не может быть отрицательным',
        ];
    }
}
