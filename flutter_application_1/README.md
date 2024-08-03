Explicación del Código

    Estructura Básica:
        CalcApp: El widget principal de la aplicación.
        CalculatorScreen: El widget con estado que contiene la lógica y los widgets de la calculadora.

    Validación de Números:
        Usamos int.tryParse para intentar convertir el texto ingresado en un número entero. Si no es posible, mostramos un mensaje de error.

    Lista Desplegable:
        Implementamos un DropdownButton para seleccionar la operación matemática.

    Cálculo y Mostrar Resultado:
        La función _calculate se encarga de realizar la operación seleccionada y actualizar el resultado.