import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';
import 'state.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  // Fungsi routing mempermudah pemanggilan dari halaman Profile
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SuggestionPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuggestionCubit(),
      child: const _SuggestionContent(),
    );
  }
}

class _SuggestionContent extends StatelessWidget {
  const _SuggestionContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saran & Kesan TPM'), centerTitle: true),
      body: BlocConsumer<SuggestionCubit, SuggestionState>(
        listener: (context, state) {
          // Menampilkan peringatan error jika ada
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
          // Kembali ke halaman profile jika sukses
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Terima kasih! Saran dan kesan berhasil dikirim.',
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Kesan saya selama mengikuti mata kuliah TPM ini sangat luar biasa dan membuka banyak wawasan baru. Pendekatan pembelajaran yang berorientasi pada praktik sangat membantu saya memahami alur pengembangan perangkat lunak secara menyeluruh. Pengalaman membangun project yang kompleks membuat proses belajar terasa menantang sekaligus sangat memuaskan. Bekal teknis dan logika penyelesaian masalah yang diajarkan di kelas ini terasa sangat relevan dan aplikatif untuk kebutuhan industri saat ini.',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 8),
                Text(
                  'Sebagai saran untuk pengembangan ke depannya, untuk pengerjaan project berskala besar di akhir, mungkin akan sangat membantu jika diberikan milestone pengerjaan yang lebih panjang sejak pertengahan semester. Hal ini akan memberikan ruang eksplorasi yang lebih leluasa bagi mahasiswa untuk mengimplementasikan fitur-fitur yang lebih kompleks. Secara keseluruhan, mata kuliah ini sudah sangat terstruktur dengan baik dan memberikan pengalaman yang berharga.',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.justify,
                ),
                // const SizedBox(height: 16),
                // TextField(
                //   maxLines: 6,
                //   decoration: const InputDecoration(
                //     hintText:
                //         'Tulis saran, kritik, atau kesan Anda di sini...',
                //     border: OutlineInputBorder(),
                //   ),
                //   onChanged: (value) => context
                //       .read<SuggestionCubit>()
                //       .onSuggestionChanged(value),
                // ),
                // const SizedBox(height: 24),
                // FilledButton(
                //   onPressed: state.isLoading
                //       ? null
                //       : () => context.read<SuggestionCubit>().submitSuggestion(),
                //   style: FilledButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(vertical: 16),
                //   ),
                //   child: state.isLoading
                //       ? const SizedBox(
                //           width: 24,
                //           height: 24,
                //           child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                //         )
                //       : const Text('Kirim Masukan', style: TextStyle(fontSize: 16)),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
