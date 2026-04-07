import 'package:flutter/material.dart';

void main() {
  runApp(const TurnoBancoApp());
}

class TurnoBancoApp extends StatelessWidget {
  const TurnoBancoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TurnoBanco',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const ListaServiciosScreen(),
    );
  }
}

class Servicio {
  final int id;
  final String nombre;
  final String descripcion;
  final int cupos;
  final String horario;
  final IconData icono;

  Servicio({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.cupos,
    required this.horario,
    required this.icono,
  });
}

final List<Servicio> servicios = [
  Servicio(
    id: 1,
    nombre: 'Apertura de cuenta',
    descripcion: 'Solicitud de cuenta de ahorros o corriente para nuevos clientes.',
    cupos: 5,
    horario: '8:00 a.m. - 3:00 p.m.',
    icono: Icons.account_balance_wallet_outlined,
  ),
  Servicio(
    id: 2,
    nombre: 'Retiro por ventanilla',
    descripcion: 'Retiro de efectivo presentando documento de identidad.',
    cupos: 8,
    horario: '8:00 a.m. - 4:00 p.m.',
    icono: Icons.payments_outlined,
  ),
  Servicio(
    id: 3,
    nombre: 'Depósito',
    descripcion: 'Consignación de dinero a cuentas bancarias en caja.',
    cupos: 10,
    horario: '8:00 a.m. - 4:00 p.m.',
    icono: Icons.savings_outlined,
  ),
  Servicio(
    id: 4,
    nombre: 'Asesoría de créditos',
    descripcion: 'Información y orientación sobre créditos personales.',
    cupos: 3,
    horario: '9:00 a.m. - 2:00 p.m.',
    icono: Icons.request_quote_outlined,
  ),
  Servicio(
    id: 5,
    nombre: 'Pago de tarjeta',
    descripcion: 'Pago y consulta de obligaciones de tarjeta de crédito.',
    cupos: 0,
    horario: '8:00 a.m. - 1:00 p.m.',
    icono: Icons.credit_card_outlined,
  ),
  Servicio(
    id: 6,
    nombre: 'Atención preferencial',
    descripcion: 'Atención prioritaria para adultos mayores y población prioritaria.',
    cupos: 4,
    horario: '8:00 a.m. - 12:00 p.m.',
    icono: Icons.support_agent_outlined,
  ),
];

class ListaServiciosScreen extends StatelessWidget {
  const ListaServiciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(28),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido a TurnoBanco',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Solicita tu turno de forma rápida y consulta los servicios disponibles en la sucursal.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFFE0ECFF),
                            child: Icon(
                              Icons.account_balance,
                              color: Color(0xFF1E3A8A),
                            ),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              'Selecciona un servicio para ver el detalle y solicitar tu turno.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Servicios disponibles',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...servicios.map((servicio) {
                      final sinCupos = servicio.cupos == 0;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: sinCupos
                                ? Colors.red.shade50
                                : const Color(0xFFE0ECFF),
                            child: Icon(
                              servicio.icono,
                              color: sinCupos
                                  ? Colors.red
                                  : const Color(0xFF1E3A8A),
                            ),
                          ),
                          title: Text(
                            servicio.nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Horario: ${servicio.horario}',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: sinCupos
                                  ? Colors.red.shade50
                                  : Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              sinCupos
                                  ? 'Sin cupos'
                                  : '${servicio.cupos} cupos',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: sinCupos
                                    ? Colors.red
                                    : Colors.green.shade700,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetalleServicioScreen(servicio: servicio),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalleServicioScreen extends StatelessWidget {
  final Servicio servicio;

  const DetalleServicioScreen({super.key, required this.servicio});

  @override
  Widget build(BuildContext context) {
    final bool sinCupos = servicio.cupos == 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del servicio'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(
                      servicio.icono,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    servicio.nombre,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _InfoCard(
              titulo: 'Descripción',
              valor: servicio.descripcion,
              icono: Icons.description_outlined,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              titulo: 'Cupos disponibles',
              valor: '${servicio.cupos}',
              icono: Icons.confirmation_num_outlined,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              titulo: 'Horario',
              valor: servicio.horario,
              icono: Icons.access_time_outlined,
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sinCupos
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SolicitarTurnoScreen(servicio: servicio),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: sinCupos
                      ? Colors.grey.shade300
                      : const Color(0xFF1E3A8A),
                  foregroundColor: sinCupos ? Colors.black54 : Colors.white,
                ),
                child: Text(
                  sinCupos ? 'Sin cupos' : 'Solicitar turno',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SolicitarTurnoScreen extends StatefulWidget {
  final Servicio servicio;

  const SolicitarTurnoScreen({super.key, required this.servicio});

  @override
  State<SolicitarTurnoScreen> createState() => _SolicitarTurnoScreenState();
}

class _SolicitarTurnoScreenState extends State<SolicitarTurnoScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController documentoController = TextEditingController();
  final TextEditingController codigoController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    documentoController.dispose();
    codigoController.dispose();
    super.dispose();
  }

  void solicitarTurno() {
    final nombre = nombreController.text.trim();
    final documento = documentoController.text.trim();
    final codigo = codigoController.text.trim();

    if (widget.servicio.cupos == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sin cupos disponibles')),
      );
      return;
    }

    if (nombre.isEmpty || documento.isEmpty || codigo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    final horaActual = TimeOfDay.now();
    final horaTexto =
        '${horaActual.hour.toString().padLeft(2, '0')}:${horaActual.minute.toString().padLeft(2, '0')}';

    print('Turno solicitado para ${widget.servicio.nombre}');
    print('Cliente: $nombre');
    print('Hora: $horaTexto');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text('Turno confirmado'),
          content: Text(
            'Hola $nombre.\n\nTu turno para ${widget.servicio.nombre} fue registrado correctamente.\nHora: $horaTexto',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar turno'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                'Estás solicitando turno para: ${widget.servicio.nombre}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: documentoController,
              decoration: InputDecoration(
                labelText: 'Documento',
                prefixIcon: const Icon(Icons.badge_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: codigoController,
              decoration: InputDecoration(
                labelText: 'Código o referencia',
                prefixIcon: const Icon(Icons.numbers_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: solicitarTurno,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF1E3A8A),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Confirmar turno',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;

  const _InfoCard({
    required this.titulo,
    required this.valor,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE0ECFF),
            child: Icon(icono, color: const Color(0xFF1E3A8A)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  valor,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}