import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innim_ui/innim_ui.dart';
import 'package:tennis_stat/blocs/application/app/app_bloc.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<AppBloc>();
    _checkState(bloc.state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        _checkState(state);
      },
      child: _buildLaunchScreen(context),
    );
  }

  Widget _buildLaunchScreen(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }

  void _checkState(AppState state) {
    if (state is AppReadySuccess) {
      context.read<AppBloc>().add(const AppLaunchScreenHidden());
    }
  }
}
