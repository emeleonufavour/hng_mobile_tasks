import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

class StatesSection extends StatelessWidget {
  final String countryId;

  const StatesSection({required this.countryId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatesBloc, StatesState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              "States: ",
              fontWeight: FontWeight.w500,
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
            ),
            10.h.horizontalSpace,
            if (state is StatesLoading)
              Center(
                  child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 1,
                ),
              )),
            if (state is StatesError)
              Center(
                  child: TextWidget(
                "Could not get states",
                fontWeight: FontWeight.w500,
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              )),
            if (state is StatesLoaded)
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.states.length,
                  separatorBuilder: (_, __) => 5.h.verticalSpace,
                  itemBuilder: (context, index) {
                    final _state = state.states[index];
                    return TextWidget(
                      _state.name,
                      fontWeight: FontWeight.w300,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
