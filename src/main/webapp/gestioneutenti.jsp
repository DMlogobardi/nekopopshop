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



        <!-- Admin Content -->
        <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
            <!-- Left Sidebar - Admin Menu -->
            <div class="lg:col-span-1">
                <!-- Quick Actions Card -->
                <div class="profile-card bg-white border-2 border-nekogreen mt-6">
                    <div class="bg-gradient-to-r from-nekogreen to-nekoblue p-4">
                        <h3 class="text-lg font-bold text-white flex items-center" style="font-size: 30px">
                            <i class="fas fa-bolt mr-2" style="font-size: 30px"></i> Azioni
                        </h3>
                    </div>
                    <div class="p-4 space-y-3">
                        <button id="addUserBtn" class="w-full bg-nekogreen hover:bg-green-600 text-white px-4 py-2 rounded-lg font-bold transition flex items-center justify-center">
                            <i class="fas fa-user-plus mr-2"></i> Aggiungi Utente
                        </button>
                        <button class="w-full bg-nekopurple hover:bg-purple-600 text-white px-4 py-2 rounded-lg font-bold transition flex items-center justify-center">
                            <i class="fas fa-file-import mr-2"></i> Importa CSV
                        </button>
                        <button class="w-full bg-nekoorange hover:bg-orange-500 text-white px-4 py-2 rounded-lg font-bold transition flex items-center justify-center">
                            <i class="fas fa-file-export mr-2"></i> Esporta CSV
                        </button>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="lg:col-span-3">
                <!-- Users Management Tab -->
                <div class="tab-content active" id="users-tab">
                    <div class="profile-card bg-white border-2 border-nekopurple">
                        <div class="bg-gradient-to-r from-nekopurple to-nekoblue p-4">
                            <div class="flex justify-between items-center">
                                <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                                    <i class="fas fa-users mr-3"></i> Gestione Utenti
                                </h2>
                                <div class="relative">
                                    <input type="text" placeholder="Cerca utente..." class="bg-white/20 border border-white/30 text-white rounded-lg px-4 py-2 pl-10 placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white">
                                    <i class="fas fa-search absolute left-3 top-3 text-white/70"></i>
                                </div>
                            </div>
                        </div>

                        <div class="p-6">
                            <!-- Filters and Stats -->
                            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                                <div class="bg-blue-50 p-3 rounded-lg">
                                    <div class="text-blue-800 font-bold text-xl">3,248</div>
                                    <div class="text-xs text-blue-600">Utenti Totali</div>
                                </div>
                                <div class="bg-green-50 p-3 rounded-lg">
                                    <div class="text-green-800 font-bold text-xl">2,987</div>
                                    <div class="text-xs text-green-600">Attivi</div>
                                </div>
                                <div class="bg-red-50 p-3 rounded-lg">
                                    <div class="text-red-800 font-bold text-xl">156</div>
                                    <div class="text-xs text-red-600">Bannati</div>
                                </div>
                                <div class="bg-yellow-50 p-3 rounded-lg">
                                    <div class="text-yellow-800 font-bold text-xl">105</div>
                                    <div class="text-xs text-yellow-600">In attesa</div>
                                </div>
                            </div>

                            <!-- Filters Row -->
                            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-4">
                                <div class="flex flex-wrap gap-2">
                                    <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                        <option>Tutti i ruoli</option>
                                        <option>Admin</option>
                                        <option>Staff</option>
                                        <option>Cliente</option>
                                    </select>
                                    <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                        <option>Tutti gli stati</option>
                                        <option>Attivo</option>
                                        <option>Bannato</option>
                                        <option>In attesa</option>
                                    </select>
                                    <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                        <option>Ordina per</option>
                                        <option>Più recenti</option>
                                        <option>Più attivi</option>
                                        <option>Ordini crescenti</option>
                                        <option>Ordini decrescenti</option>
                                    </select>
                                </div>
                                <div class="flex items-center">
                                    <span class="text-sm text-gray-600 mr-2">Mostra:</span>
                                    <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                        <option>25</option>
                                        <option>50</option>
                                        <option>100</option>
                                        <option>Tutti</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Users Table -->
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Utente</th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ruolo</th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Stato</th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ordini</th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Azioni</th>
                                    </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                    <!-- User 1 -->
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-USER-001</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=100" alt="User 1">
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900">NekoFan123</div>
                                                    <div class="text-sm text-gray-500">Registrato: 15/03/2022</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">nekofan123@example.com</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-role-customer">Cliente</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-status-active">Attivo</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">24</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                            <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                            <button class="text-nekogreen hover:text-green-600 ml-3"><i class="fas fa-eye"></i></button>
                                        </td>
                                    </tr>

                                    <!-- User 2 -->
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-USER-002</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?q=80&w=100" alt="User 2">
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900">AdminNeko</div>
                                                    <div class="text-sm text-gray-500">Registrato: 10/01/2020</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">admin@nekopopshop.com</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-role-admin">Admin</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-status-active">Attivo</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">-</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                            <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                            <button class="text-nekogreen hover:text-green-600 ml-3"><i class="fas fa-eye"></i></button>
                                        </td>
                                    </tr>

                                    <!-- User 3 -->
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-USER-003</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=100" alt="User 3">
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900">MangaLover</div>
                                                    <div class="text-sm text-gray-500">Registrato: 22/05/2023</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">mangalover@example.com</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-role-customer">Cliente</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-status-banned">Bannato</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">5</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                            <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                            <button class="text-nekogreen hover:text-green-600 ml-3"><i class="fas fa-eye"></i></button>
                                        </td>
                                    </tr>

                                    <!-- User 4 -->
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-USER-004</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=100" alt="User 4">
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900">StaffNeko</div>
                                                    <div class="text-sm text-gray-500">Registrato: 15/08/2021</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">staff@nekopopshop.com</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-role-staff">Staff</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-status-active">Attivo</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">-</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                            <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                            <button class="text-nekogreen hover:text-green-600 ml-3"><i class="fas fa-eye"></i></button>
                                        </td>
                                    </tr>

                                    <!-- User 5 -->
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-USER-005</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-10 w-10">
                                                    <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1524504388940-b1c1722653e1?q=80&w=100" alt="User 5">
                                                </div>
                                                <div class="ml-4">
                                                    <div class="text-sm font-medium text-gray-900">NewUser</div>
                                                    <div class="text-sm text-gray-500">Registrato: 01/11/2023</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">newuser@example.com</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-role-customer">Cliente</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-2 py-1 text-xs rounded-full user-status-pending">In attesa</span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">0</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                            <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                            <button class="text-nekogreen hover:text-green-600 ml-3"><i class="fas fa-eye"></i></button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination -->
                            <div class="flex items-center justify-between mt-6">
                                <div class="text-sm text-gray-500">
                                    Mostrando <span class="font-medium">1</span> a <span class="font-medium">5</span> di <span class="font-medium">3,248</span> utenti
                                </div>
                                <div class="flex space-x-2">
                                    <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        Precedente
                                    </button>
                                    <button class="px-3 py-1 rounded-md border border-nekoblue bg-nekoblue text-sm font-medium text-white">
                                        1
                                    </button>
                                    <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        2
                                    </button>
                                    <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        3
                                    </button>
                                    <span class="px-3 py-1 text-sm text-gray-500">...</span>
                                    <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        25
                                    </button>
                                    <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        Successivo
                                    </button>
                                </div>
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
