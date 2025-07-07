<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Gestione Utenti</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/gestioneutenti.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/gestioneUtenti_Dinamic.js" defer></script>
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
        </div>
    </div>


        <!-- Admin Content -->
    <div class="container mx-auto px-4 lg:px-8 py-6">
        <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
            <div class="lg:col-span-3 w-full">
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden rounded-xl w-full">
                    <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                            <h2 class="text-2xl md:text-3xl font-bold text-white flex items-center">
                                <i class="fas fa-users mr-3"></i> Gestione Utenti
                            </h2>
                        </div>
                    </div>

                    <div class="p-6">
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 mb-6">
                            <div class="bg-blue-50 p-4 rounded-lg text-center">
                                <div id="tot" class="text-blue-800 font-bold text-2xl">3,248</div>
                                <div class="text-xs text-blue-600">Utenti Totali</div>
                            </div>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Utente</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
                                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Ordini</th>
                                </tr>
                                </thead>
                                <tbody id="table" class="bg-white divide-y divide-gray-200">

                                </tbody>
                            </table>
                        </div>

                        <div class="flex flex-col md:flex-row items-start md:items-center justify-between mt-6 gap-4">
                            <div class="flex flex-wrap space-x-2 justify-center">
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm text-gray-500 hover:bg-gray-50">
                                    Precedente
                                </button>
                                <button class="px-3 py-1 rounded-md border border-nekoblue bg-nekoblue text-sm text-white">
                                    1
                                </button>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm text-gray-500 hover:bg-gray-50">
                                    2
                                </button>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm text-gray-500 hover:bg-gray-50">
                                    3
                                </button>
                                <span class="px-3 py-1 text-sm text-gray-500">...</span>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm text-gray-500 hover:bg-gray-50">
                                    25
                                </button>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm text-gray-500 hover:bg-gray-50">
                                    Successivo
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div id="addUserModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
        <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
            <div class="bg-gradient-to-r from-nekopurple to-nekoblue p-4 rounded-t-lg">
                <div class="flex justify-between items-center">
                    <h3 class="text-xl font-bold text-white"><i class="fas fa-user-plus mr-2"></i> Aggiungi Nuovo Utente</h3>
                    <button id="closeModalBtn" class="text-white hover:text-gray-200">
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
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="userName">Nome Utente</label>
                                <input type="text" id="userName" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                            </div>

                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="userEmail">Email</label>
                                <input type="email" id="userEmail" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                            </div>

                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="userPassword">Password</label>
                                <input type="password" id="userPassword" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                            </div>

                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="userRole">Ruolo</label>
                                <select id="userRole" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                    <option value="customer">Cliente</option>
                                    <option value="staff">Staff</option>
                                    <option value="admin">Admin</option>
                                </select>
                            </div>
                        </div>

                        <!-- Right Column -->
                        <div>
                            <div class="mb-4">
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="userStatus">Stato</label>
                                <select id="userStatus" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                    <option value="active">Attivo</option>
                                    <option value="pending">In attesa</option>
                                    <option value="banned">Bannato</option>
                                </select>
                            </div>

                            <div class="mb-4">
                                <%--@declare id="useravatar"--%><label class="block text-gray-700 text-sm font-bold mb-2" for="userAvatar">Avatar</label>
                                <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-full overflow-hidden bg-gray-100">
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
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="userNotes">Note</label>
                                <textarea id="userNotes" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="flex justify-end mt-6 space-x-3">
                        <button type="button" id="cancelModalBtn" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                            Annulla
                        </button>
                        <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                            Salva Utente
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
