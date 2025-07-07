<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>NekoPopShop - Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/admin.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="frontend/Scripts/dashboard_dinamic.js" defer></script>
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
            nekopurple: '#9c6ade',
            kawaiblue: '#6a8cde',
            kawaililac: '#d8b4fe',
            adminblue: '#3a86ff',
            adminindigo: '#5e60ce'
          }
        }
      }
    }
  </script>

</head>
<body class="relative overflow-x-hidden bg-gray-50">

<script>
  function caricaContenuto(pagina) {
    $("#contenuto").load(pagina);
  }
</script>
<div id="decorations"></div>

<!-- Main Content -->
<div class="container mx-auto px-4 md:px-8 py-6">
  <!-- Welcome Banner -->
  <div class="admin-card p-6 bg-white rounded-xl mb-8">
    <div class="flex flex-col md:flex-row items-start md:items-center justify-between">
      <div>
        <h2 class="text-xl font-bold text-gray-800 mb-2">Benvenuto, <span class="text-admin-gradient">Admin Master</span> 👋</h2>
        <p class="text-gray-600">Ecco una panoramica dello stato del tuo negozio. Hai <span class="font-bold text-nekopeach">12 nuovi ordini</span></p>
      </div>
    </div>
  </div>

  <!-- Quick Stats -->
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
    <!-- Order Stats -->
    <div class="stat-card p-5">
      <div class="flex items-start justify-between">
        <div>
          <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Ordini Oggi</p>
          <h3 class="text-xs font-bold text-gray-800 mt-1">24</h3>
          <div class="mt-3">
                  <span class="text-green-500 text-xs font-bold flex items-center">
                    <i class="fas fa-arrow-up mr-1"></i> 12% vs ieri
                  </span>
          </div>
        </div>
        <div class="w-10 h-10 rounded-full bg-nekopink/20 flex items-center justify-center">
          <i class="fas fa-shopping-cart text-nekopeach text-2xl"></i>
        </div>
      </div>
      <div class="mt-4">
        <div class="progress">
          <div class="progress-bar bg-gradient-to-r from-nekopink to-nekopeach" style="width: 65%;"></div>
        </div>
      </div>
    </div>

    <!-- Revenue Stats -->
    <div class="stat-card p-5">
      <div class="flex items-start justify-between">
        <div>
          <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Guadagni Oggi</p>
          <h3 class="text-xs font-bold text-gray-800 mt-1">&#8364 1,245</h3>
          <div class="mt-3">
                  <span class="text-green-500 text-xs font-bold flex items-center">
                    <i class="fas fa-arrow-up mr-1"></i> 8% vs ieri
                  </span>
          </div>
        </div>
        <div class="w-10 h-10 rounded-full bg-green-100/20 flex items-center justify-center">
          <i class="fas fa-euro-sign text-green-500 text-2xl"></i>
        </div>
      </div>
      <div class="mt-4">
        <div class="progress">
          <div class="progress-bar bg-gradient-to-r from-green-400 to-green-600" style="width: 75%;"></div>
        </div>
      </div>
    </div>

    <!-- Customer Stats -->
    <div class="stat-card p-5">
      <div class="flex items-start justify-between">
        <div>
          <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Nuovi Clienti</p>
          <h3 class="text- font-bold text-gray-800 mt-1">18</h3>
          <div class="mt-3">
                  <span class="text-green-500 text-xs font-bold flex items-center">
                    <i class="fas fa-arrow-up mr-1"></i> 5 vs ieri
                  </span>
          </div>
        </div>
        <div class="w-10 h-10 rounded-full bg-blue-100/20 flex items-center justify-center">
          <i class="fas fa-user-plus text-blue-500 text-2xl"></i>
        </div>
      </div>
      <div class="mt-4">
        <div class="progress">
          <div class="progress-bar bg-gradient-to-r from-blue-400 to-blue-600" style="width: 55%;"></div>
        </div>
      </div>
    </div>
  </div>



  <!-- Recent Orders & Top Products -->
  <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mx-auto px-4 md:px-8 py-6">
    <!-- Recent Orders -->
    <div class="admin-card">
      <div class="p-5 border-b border-gray-200">
        <h3 class="text-lg font-bold text-gray-800" style="font-size: 30px">Ordini Recenti</h3>
        <p class="text-sm text-gray-500">Ultimi 10 ordini effettuati</p>
      </div>
      <div class="overflow-x-auto">
        <table class="admin-table custom-scrollbar">
          <thead>
          <tr>
            <th class="text-white">ID</th>
            <th class="text-white">Cliente</th>
            <th class="text-white">Stato</th>
            <th class="text-white">Totale</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>#ORD-10245</td>
            <td class="flex items-center">
              <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="User" class="avatar mr-2">
              <span>Marta Rossi</span>
            </td>
            <td><span class="order-status status-processing"></span> <span class="badge badge-primary">In lavorazione</span></td>
            <td class="font-bold">&#8364 84.99</td>
          </tr>
          <tr>
            <td>#ORD-10244</td>
            <td class="flex items-center">
              <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="User" class="avatar mr-2">
              <span>Luca Bianchi</span>
            </td>
            <td><span class="order-status status-shipped"></span> <span class="badge badge-success">Spedito</span></td>
            <td class="font-bold">&#8364 45.50</td>
          </tr>
          <tr>
            <td>#ORD-10243</td>
            <td class="flex items-center">
              <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="User" class="avatar mr-2">
              <span>Anna Verdi</span>
            </td>
            <td><span class="order-status status-delivered"></span> <span class="badge badge-info">Consegnato</span></td>
            <td class="font-bold">&#8364 112.99</td>
          </tr>
          <tr>
            <td>#ORD-10242</td>
            <td class="flex items-center">
              <img src="https://randomuser.me/api/portraits/men/22.jpg" alt="User" class="avatar mr-2">
              <span>Marco Neri</span>
            </td>
            <td><span class="order-status status-pending"></span> <span class="badge badge-warning">In attesa</span></td>
            <td class="font-bold">&#8364 67.30</td>
          </tr>
          <tr>
            <td>#ORD-10241</td>
            <td class="flex items-center">
              <img src="https://randomuser.me/api/portraits/women/56.jpg" alt="User" class="avatar mr-2">
              <span>Sara Gialli</span>
            </td>
            <td><span class="order-status status-cancelled"></span> <span class="badge badge-danger">Cancellato</span></td>
            <td class="font-bold">&#8364 99.99</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="p-4 border-t border-gray-200 text-right">
        <a href="#" class="text-sm font-semibold text-nekopeach hover:underline">Vedi tutti gli ordini →</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>