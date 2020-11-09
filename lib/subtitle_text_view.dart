import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subtitle_wrapper_package/bloc/subtitle_bloc.dart';
import 'package:subtitle_wrapper_package/data/constants/view_keys.dart';
import 'package:subtitle_wrapper_package/data/models/style/subtitle_style.dart';

class SubtitleTextView extends StatelessWidget {
  final SubtitleStyle subtitleStyle;

  const SubtitleTextView({Key key, @required this.subtitleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    SubtitleBloc subtitleBloc = BlocProvider.of<SubtitleBloc>(context);
    return BlocConsumer<SubtitleBloc, SubtitleState>(
      listener: (context, state) {
        if (state is SubtitleInitialized) {
          subtitleBloc.add(LoadSubtitle());
        }
      },
      builder: (context, state) {
        if (state is LoadedSubtitle) {
          return Container(
            child: Stack(
              children: <Widget>[
                subtitleStyle.hasBorder
                    ? Center(
                        child: Container(
                          padding: subtitleStyle.padding,
                          color: subtitleStyle.backgroundColor,
                          child: Text(
                            state.subtitle.text,
                            textAlign: TextAlign.center,
                            style: subtitleStyle.textStyle ??
                                TextStyle(
                                  fontSize: subtitleStyle.fontSize,
                                  shadows: subtitleStyle.shadows ?? <Shadow>[],
                                  foreground: Paint()
                                    ..style = subtitleStyle.borderStyle.style
                                    ..strokeWidth =
                                        subtitleStyle.borderStyle.strokeWidth
                                    ..color = subtitleStyle.borderStyle.color,
                                ),
                          ),
                        ),
                      )
                    : Container(
                        child: null,
                      ),
                Center(
                  child: Container(
                    padding: subtitleStyle.padding,
                    color: subtitleStyle.backgroundColor,
                    child: Text(
                      state.subtitle.text,
                      key: ViewKeys.SUBTITLE_TEXT_CONTENT,
                      textAlign: TextAlign.center,
                      style: subtitleStyle.textStyle ??
                          TextStyle(
                            shadows: subtitleStyle.shadows ?? <Shadow>[],
                            fontSize: subtitleStyle.fontSize,
                            color: subtitleStyle.textColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
