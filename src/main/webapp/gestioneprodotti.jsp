<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Gestione Prodotti</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/gestioneprodotti.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/gestioneprodotti_DInamic.js" defer></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        nekopink: '#fbd8da',
                        nekopeach: '#e55458',
                        nekobeige: '#f2d5bb',
                        nekoorange: '#f29966',
                        nekored: '#f24535',
                        nekoblue: '#3b82f6',
                        nekogreen: '#10b981',
                        nekopurple: '#8b5cf6'
                    }
                }
            }
        }
    </script>

</head>
<body class="relative overflow-x-hidden">
<!-- Decorative elements -->
<div id="decorations"></div>

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">


        </div>

        <!-- Navigation -->

    </div>

    <!-- Admin Content -->
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">

            <!-- Main Content -->
            <div class="col-span-1 lg:col-span-4 flex flex-col w-full">
                <div class="tab-content active w-full">
                    <div class="profile-card bg-white border-2 border-nekopink overflow-hidden w-full">
                        <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                            <div class="flex flex-col md:flex-row justify-between items-center gap-4">
                                <h2 class="text-xl md:text-2xl lg:text-3xl font-bold text-white flex items-center">
                                    <i class="fas fa-boxes mr-3"></i> Gestione Prodotti
                                </h2>
                                <div class="relative w-full max-w-md">
                                    <input
                                            type="text"
                                            placeholder="Cerca prodotto..."
                                            class="w-full bg-white/20 border border-white/30 text-white rounded-lg px-4 py-2 pl-10 placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white"
                                    />
                                    <i class="fas fa-search absolute left-3 top-3 text-white/70"></i>
                                </div>
                            </div>
                        </div>
                        <div class="p-6">

                            <!-- Filters and Stats -->
                            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                                <div class="bg-blue-50 p-3 rounded-lg">
                                    <div class="text-blue-800 font-bold text-xl">1,248</div>
                                    <div class="text-xs text-blue-600">Prodotti Totali</div>
                                </div>
                                <div class="bg-green-50 p-3 rounded-lg">
                                    <div class="text-green-800 font-bold text-xl">1,012</div>
                                    <div class="text-xs text-green-600">Disponibili</div>
                                </div>
                            </div>

                            <!-- Products Table -->
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-200 w-full table-auto">
                                    <thead class="bg-gray-50">
                                    <tr>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            ID
                                        </th>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Prodotto
                                        </th>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Categoria
                                        </th>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Prezzo
                                        </th>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Quantità
                                        </th>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Stato
                                        </th>
                                        <th
                                                scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                        >
                                            Azioni
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                    <!-- Product 1 -->
                                    <tr class="hover:bg-gray-50">
                                        <td
                                                class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
                                        >
                                            #NEKO-001
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img
                                                            class="h-10 w-10 rounded"
                                                            src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100"
                                                            alt="Jujutsu Kaisen"
                                                    />
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900">
                                                        Jujutsu Kaisen Vol.15
                                                    </div>
                                                    <div class="text-sm text-gray-500">Manga</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                      <span class="px-2 py-1 text-xs rounded-full category-manga"
                      >Manga</span
                      >
                                        </td>
                                        <td
                                                class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                        >
                                            €14.99
                                        </td>
                                        <td
                                                class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                        >
                                            42
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                      <span
                              class="px-2 py-1 text-xs rounded-full status-active"
                      >Disponibile</span
                      >
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <button class="text-nekoblue hover:text-blue-600 mr-3">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="text-nekored hover:text-red-600">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination -->
                            <div class="flex items-center justify-between mt-6 flex-wrap gap-2">
                                <nav
                                        class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px"
                                        aria-label="Pagination"
                                >
                                    <a
                                            href="#"
                                            class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50"
                                    >
                                        <span class="sr-only">Previous</span>
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                    <a
                                            href="#"
                                            aria-current="page"
                                            class="relative inline-flex items-center px-4 py-2 border border-nekopink bg-nekopink text-white text-sm font-medium"
                                    >1</a
                                    >
                                    <a
                                            href="#"
                                            class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50"
                                    >2</a
                                    >
                                    <a
                                            href="#"
                                            class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50"
                                    >3</a
                                    >
                                    <a
                                            href="#"
                                            class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50"
                                    >
                                        <span class="sr-only">Next</span>
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>



    <!-- Remove Product Modal -->
<div id="removeProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekored to-nekopeach p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-plus mr-2"></i> Aggiungi Nuovo Prodotto</h3>
                <button id="closeModalBtn1" class="text-white hover:text-gray-200">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <div class="p-6">
            <form>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Left Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName1">Nome Prodotto</label>
                            <input type="text" id="productName1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory1">Categoria</label>
                            <select id="productCategory1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="manga">Manga</option>
                                <option value="figure">Action Figure</option>
                                <option value="merch">Merchandising</option>
                                <option value="accessories">Accessori</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice1">Prezzo (&#8364)</label>
                            <input type="number" step="0.01" id="productPrice1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStock1">Quantità in Stock</label>
                            <input type="number" id="productStock1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStatus1">Stato</label>
                            <select id="productStatus1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="active">Disponibile</option>
                                <option value="inactive">Esaurito</option>
                                <option value="coming">In arrivo</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productSKU1">SKU</label>
                            <input type="text" id="productSKU1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <%--@declare id="productimage1"--%><label class="block text-gray-700 text-sm font-bold mb-2" for="productImage1">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>
                                <button type="button" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nekoblue">
                                    Cambia
                                </button>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription1">Descrizione</label>
                            <textarea id="productDescription1" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                        </div>
                    </div>
                </div>

                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelModalBtn1" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annulla
                    </button>
                    <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Prodotto
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekogreen to-nekoblue p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-plus mr-2"></i> Aggiungi Nuovo Prodotto</h3>
                <button id="closeModalBtn2" class="text-white hover:text-gray-200">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <div class="p-6">
            <form>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Left Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName2">Nome Prodotto</label>
                            <input type="text" id="productName2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory2">Categoria</label>
                            <select id="productCategory2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="manga">Manga</option>
                                <option value="figure">Action Figure</option>
                                <option value="merch">Merchandising</option>
                                <option value="accessories">Accessori</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice2">Prezzo (&#8364)</label>
                            <input type="number" step="0.01" id="productPrice2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStock2">Quantità in Stock</label>
                            <input type="number" id="productStock2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStatus2">Stato</label>
                            <select id="productStatus2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="active">Disponibile</option>
                                <option value="inactive">Esaurito</option>
                                <option value="coming">In arrivo</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productSKU2">SKU</label>
                            <input type="text" id="productSKU2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <%--@declare id="productimage2"--%><label class="block text-gray-700 text-sm font-bold mb-2" for="productImage2">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>
                                <button type="button" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nekoblue">
                                    Cambia
                                </button>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription2">Descrizione</label>
                            <textarea id="productDescription2" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                        </div>
                    </div>
                </div>

                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelModalBtn2" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annulla
                    </button>
                    <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Prodotto
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modify Product Modal -->
<div id="modifyProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekopurple to-nekoblue p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-plus mr-2"></i> Aggiungi Nuovo Prodotto</h3>
                <button id="closeModalBtn3" class="text-white hover:text-gray-200">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <div class="p-6">
            <form>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Left Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName3">Nome Prodotto</label>
                            <input type="text" id="productName3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory3">Categoria</label>
                            <select id="productCategory3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="manga">Manga</option>
                                <option value="figure">Action Figure</option>
                                <option value="merch">Merchandising</option>
                                <option value="accessories">Accessori</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice3">Prezzo (&#8364)</label>
                            <input type="number" step="0.01" id="productPrice3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStock3">Quantità in Stock</label>
                            <input type="number" id="productStock3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStatus3">Stato</label>
                            <select id="productStatus3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="active">Disponibile</option>
                                <option value="inactive">Esaurito</option>
                                <option value="coming">In arrivo</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productSKU3">SKU</label>
                            <input type="text" id="productSKU3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <%--@declare id="productimage3"--%><label class="block text-gray-700 text-sm font-bold mb-2" for="productImage3">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>
                                <button type="button" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nekoblue">
                                    Cambia
                                </button>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription3">Descrizione</label>
                            <textarea id="productDescription3" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                        </div>
                    </div>
                </div>

                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelModalBtn3" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annulla
                    </button>
                    <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Prodotto
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>
