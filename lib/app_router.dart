import 'package:go_router/go_router.dart';
import 'pages/donaciones_sala.dart';
import 'pages/museo_home_page.dart';
import 'pages/plan_visita.dart';
import 'pages/salas_exposiciones_page.dart';
import 'pages/tienda_recuerdos.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => MuseoHomePage(),
    ),
    GoRoute(
      path: '/salas_exposiciones',
      builder: (_, __) => SalasExposicionesPage(),
    ),
    GoRoute(
      path: '/plan',
      builder: (_, __) => PlanScreen(),
    ),
    GoRoute(
      path: '/tienda',
      builder: (_, __) => TiendaRecuerdosPage(),
    ),
    GoRoute(
      path: '/donaciones',
      builder: (_, __) => DonacionesScreen(),
    )
  ],
);
