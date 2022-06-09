import 'dart:html';
import '../core/mdl.dart';
import '../core/widget.dart';

class ColoredFabButton extends _Button {
  ColoredFabButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored",
        );
}

class FabButton extends _Button {
  FabButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect",
        );
}

class RaisedButton extends _Button {
  RaisedButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect",
        );
}

class ColoredButton extends _Button {
  ColoredButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect",
        );
}

class AccentButton extends _Button {
  AccentButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent",
        );
}

class FlatButton extends _Button {
  FlatButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-js-ripple-effect",
        );
}

class ColoredFlatButton extends _Button {
  ColoredFlatButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--primary mdl-js-ripple-effect",
        );
}

class AccentFlatButton extends _Button {
  AccentFlatButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--accent mdl-js-ripple-effect",
        );
}

class MiniFabButton extends _Button {
  MiniFabButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-js-ripple-effect",
        );
}

class ColoredMiniFabButton extends _Button {
  ColoredMiniFabButton({required String text, void Function()? onPressed, bool disabled = false})
      : super(
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          className: "mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored mdl-js-ripple-effect",
        );
}

class _Button extends Widget {
  final String className;
  final String text;
  final bool disabled;
  final void Function()? onPressed;

  _Button({required this.text, required this.className, this.onPressed, this.disabled = false});

  @override
  Element build() {
    final button = ButtonElement();
    button.text = text;
    button.type = "button";
    button.disabled = disabled;
    button.className = className;
    button.onClick.listen((_) => onPressed?.call());
    convertToMdlComponent(button);
    return button;
  }
}

// ButtonElement _buttonElement(
//     {bool? autofocus,
//     bool? disabled,
//     String? formAction,
//     String? formEnctype,
//     String? formMethod,
//     bool? formNoValidate,
//     String? formTarget,
//     String? name,
//     String? type,
//     String? value,
//     String? nonce,
//     Map<String, String>? attributes,
//     List<Element>? children,
//     Iterable<String>? classes,
//     Map<String, String>? dataset,
//     String? innerHtml,
//     String? innerText,
//     int? scrollLeft,
//     int? scrollTop,
//     String? contentEditable,
//     String? dir,
//     bool? draggable,
//     bool? hidden,
//     bool? inert,
//     String? inputMode,
//     String? lang,
//     bool? spellcheck,
//     int? tabIndex,
//     String? title,
//     bool? translate,
//     String? className,
//     String? id,
//     String? slot,
//     Iterable<Node>? nodes,
//     String? text,
//     void Function(Event)? onAbort,
//     void Function(Event)? onBeforeCopy,
//     void Function(Event)? onBeforeCut,
//     void Function(Event)? onBeforePaste,
//     void Function(Event)? onBlur,
//     void Function(Event)? onCanPlay,
//     void Function(Event)? onCanPlayThrough,
//     void Function(Event)? onChange,
//     void Function(MouseEvent)? onClick,
//     void Function(MouseEvent)? onContextMenu,
//     void Function(ClipboardEvent)? onCopy,
//     void Function(ClipboardEvent)? onCut,
//     void Function(Event)? onDoubleClick,
//     void Function(MouseEvent)? onDrag,
//     void Function(MouseEvent)? onDragEnd,
//     void Function(MouseEvent)? onDragEnter,
//     void Function(MouseEvent)? onDragLeave,
//     void Function(MouseEvent)? onDragOver,
//     void Function(MouseEvent)? onDragStart,
//     void Function(MouseEvent)? onDrop,
//     void Function(Event)? onDurationChange,
//     void Function(Event)? onEmptied,
//     void Function(Event)? onEnded,
//     void Function(Event)? onError,
//     void Function(Event)? onFocus,
//     void Function(Event)? onInput,
//     void Function(Event)? onInvalid,
//     void Function(KeyboardEvent)? onKeyDown,
//     void Function(KeyboardEvent)? onKeyPress,
//     void Function(KeyboardEvent)? onKeyUp,
//     void Function(Event)? onLoad,
//     void Function(Event)? onLoadedData,
//     void Function(Event)? onLoadedMetadata,
//     void Function(MouseEvent)? onMouseDown,
//     void Function(MouseEvent)? onMouseEnter,
//     void Function(MouseEvent)? onMouseLeave,
//     void Function(MouseEvent)? onMouseMove,
//     void Function(MouseEvent)? onMouseOut,
//     void Function(MouseEvent)? onMouseOver,
//     void Function(MouseEvent)? onMouseUp,
//     void Function(WheelEvent)? onMouseWheel,
//     void Function(ClipboardEvent)? onPaste,
//     void Function(Event)? onPause,
//     void Function(Event)? onPlay,
//     void Function(Event)? onPlaying,
//     void Function(Event)? onRateChange,
//     void Function(Event)? onReset,
//     void Function(Event)? onResize,
//     void Function(Event)? onScroll,
//     void Function(Event)? onSearch,
//     void Function(Event)? onSeeked,
//     void Function(Event)? onSeeking,
//     void Function(Event)? onSelect,
//     void Function(Event)? onSelectStart,
//     void Function(Event)? onStalled,
//     void Function(Event)? onSubmit,
//     void Function(Event)? onSuspend,
//     void Function(Event)? onTimeUpdate,
//     void Function(TouchEvent)? onTouchCancel,
//     void Function(TouchEvent)? onTouchEnd,
//     void Function(TouchEvent)? onTouchEnter,
//     void Function(TouchEvent)? onTouchLeave,
//     void Function(TouchEvent)? onTouchMove,
//     void Function(TouchEvent)? onTouchStart,
//     void Function(TransitionEvent)? onTransitionEnd,
//     void Function(Event)? onVolumeChange,
//     void Function(Event)? onWaiting,
//     void Function(Event)? onFullscreenChange,
//     void Function(Event)? onFullscreenError,
//     void Function(WheelEvent)? onWheel}) {
//   final v = ButtonElement();
//   if (autofocus != null) v.autofocus = autofocus;
//   if (disabled != null) v.disabled = disabled;
//   if (formAction != null) v.formAction = formAction;
//   if (formEnctype != null) v.formEnctype = formEnctype;
//   if (formMethod != null) v.formMethod = formMethod;
//   if (formNoValidate != null) v.formNoValidate = formNoValidate;
//   if (formTarget != null) v.formTarget = formTarget;
//   if (name != null) v.name = name;
//   if (type != null) v.type = type;
//   if (value != null) v.value = value;
//   if (nonce != null) v.nonce = nonce;
//   if (attributes != null) v.attributes = attributes;
//   if (children != null) v.children = children;
//   if (classes != null) v.classes = classes;
//   if (dataset != null) v.dataset = dataset;
//   if (innerHtml != null) v.innerHtml = innerHtml;
//   if (innerText != null) v.innerText = innerText;
//   if (scrollLeft != null) v.scrollLeft = scrollLeft;
//   if (scrollTop != null) v.scrollTop = scrollTop;
//   if (contentEditable != null) v.contentEditable = contentEditable;
//   if (dir != null) v.dir = dir;
//   if (draggable != null) v.draggable = draggable;
//   if (hidden != null) v.hidden = hidden;
//   if (inert != null) v.inert = inert;
//   if (inputMode != null) v.inputMode = inputMode;
//   if (lang != null) v.lang = lang;
//   if (spellcheck != null) v.spellcheck = spellcheck;
//   if (tabIndex != null) v.tabIndex = tabIndex;
//   if (title != null) v.title = title;
//   if (translate != null) v.translate = translate;
//   if (className != null) v.className = className;
//   if (id != null) v.id = id;
//   if (slot != null) v.slot = slot;
//   if (nodes != null) v.nodes = nodes;
//   if (text != null) v.text = text;
//   if (onAbort != null) v.onAbort.listen(onAbort);
//   if (onBeforeCopy != null) v.onBeforeCopy.listen(onBeforeCopy);
//   if (onBeforeCut != null) v.onBeforeCut.listen(onBeforeCut);
//   if (onBeforePaste != null) v.onBeforePaste.listen(onBeforePaste);
//   if (onBlur != null) v.onBlur.listen(onBlur);
//   if (onCanPlay != null) v.onCanPlay.listen(onCanPlay);
//   if (onCanPlayThrough != null) v.onCanPlayThrough.listen(onCanPlayThrough);
//   if (onChange != null) v.onChange.listen(onChange);
//   if (onClick != null) v.onClick.listen(onClick);
//   if (onContextMenu != null) v.onContextMenu.listen(onContextMenu);
//   if (onCopy != null) v.onCopy.listen(onCopy);
//   if (onCut != null) v.onCut.listen(onCut);
//   if (onDoubleClick != null) v.onDoubleClick.listen(onDoubleClick);
//   if (onDrag != null) v.onDrag.listen(onDrag);
//   if (onDragEnd != null) v.onDragEnd.listen(onDragEnd);
//   if (onDragEnter != null) v.onDragEnter.listen(onDragEnter);
//   if (onDragLeave != null) v.onDragLeave.listen(onDragLeave);
//   if (onDragOver != null) v.onDragOver.listen(onDragOver);
//   if (onDragStart != null) v.onDragStart.listen(onDragStart);
//   if (onDrop != null) v.onDrop.listen(onDrop);
//   if (onDurationChange != null) v.onDurationChange.listen(onDurationChange);
//   if (onEmptied != null) v.onEmptied.listen(onEmptied);
//   if (onEnded != null) v.onEnded.listen(onEnded);
//   if (onError != null) v.onError.listen(onError);
//   if (onFocus != null) v.onFocus.listen(onFocus);
//   if (onInput != null) v.onInput.listen(onInput);
//   if (onInvalid != null) v.onInvalid.listen(onInvalid);
//   if (onKeyDown != null) v.onKeyDown.listen(onKeyDown);
//   if (onKeyPress != null) v.onKeyPress.listen(onKeyPress);
//   if (onKeyUp != null) v.onKeyUp.listen(onKeyUp);
//   if (onLoad != null) v.onLoad.listen(onLoad);
//   if (onLoadedData != null) v.onLoadedData.listen(onLoadedData);
//   if (onLoadedMetadata != null) v.onLoadedMetadata.listen(onLoadedMetadata);
//   if (onMouseDown != null) v.onMouseDown.listen(onMouseDown);
//   if (onMouseEnter != null) v.onMouseEnter.listen(onMouseEnter);
//   if (onMouseLeave != null) v.onMouseLeave.listen(onMouseLeave);
//   if (onMouseMove != null) v.onMouseMove.listen(onMouseMove);
//   if (onMouseOut != null) v.onMouseOut.listen(onMouseOut);
//   if (onMouseOver != null) v.onMouseOver.listen(onMouseOver);
//   if (onMouseUp != null) v.onMouseUp.listen(onMouseUp);
//   if (onMouseWheel != null) v.onMouseWheel.listen(onMouseWheel);
//   if (onPaste != null) v.onPaste.listen(onPaste);
//   if (onPause != null) v.onPause.listen(onPause);
//   if (onPlay != null) v.onPlay.listen(onPlay);
//   if (onPlaying != null) v.onPlaying.listen(onPlaying);
//   if (onRateChange != null) v.onRateChange.listen(onRateChange);
//   if (onReset != null) v.onReset.listen(onReset);
//   if (onResize != null) v.onResize.listen(onResize);
//   if (onScroll != null) v.onScroll.listen(onScroll);
//   if (onSearch != null) v.onSearch.listen(onSearch);
//   if (onSeeked != null) v.onSeeked.listen(onSeeked);
//   if (onSeeking != null) v.onSeeking.listen(onSeeking);
//   if (onSelect != null) v.onSelect.listen(onSelect);
//   if (onSelectStart != null) v.onSelectStart.listen(onSelectStart);
//   if (onStalled != null) v.onStalled.listen(onStalled);
//   if (onSubmit != null) v.onSubmit.listen(onSubmit);
//   if (onSuspend != null) v.onSuspend.listen(onSuspend);
//   if (onTimeUpdate != null) v.onTimeUpdate.listen(onTimeUpdate);
//   if (onTouchCancel != null) v.onTouchCancel.listen(onTouchCancel);
//   if (onTouchEnd != null) v.onTouchEnd.listen(onTouchEnd);
//   if (onTouchEnter != null) v.onTouchEnter.listen(onTouchEnter);
//   if (onTouchLeave != null) v.onTouchLeave.listen(onTouchLeave);
//   if (onTouchMove != null) v.onTouchMove.listen(onTouchMove);
//   if (onTouchStart != null) v.onTouchStart.listen(onTouchStart);
//   if (onTransitionEnd != null) v.onTransitionEnd.listen(onTransitionEnd);
//   if (onVolumeChange != null) v.onVolumeChange.listen(onVolumeChange);
//   if (onWaiting != null) v.onWaiting.listen(onWaiting);
//   if (onFullscreenChange != null) v.onFullscreenChange.listen(onFullscreenChange);
//   if (onFullscreenError != null) v.onFullscreenError.listen(onFullscreenError);
//   if (onWheel != null) v.onWheel.listen(onWheel);
//   return v;
// }