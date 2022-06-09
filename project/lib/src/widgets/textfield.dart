import 'dart:html';

import '../core/helper.dart';
import '../core/mdl.dart';
import '../core/widget.dart';

enum TextFieldType {
  text,
  password,
  number,
  // email,
  // tel,
  // url,
  // search,
  // date,
  // time,
  // datetime,
  // month,
  // week,
  // color,
}

class TextField extends _TextField {
  TextField({TextFieldType type = TextFieldType.text, String label = "", String pattern = "", String errorText = ""})
      : super(
          type: type,
          label: label,
          pattern: pattern,
          errorText: errorText,
          className: "mdl-textfield mdl-js-textfield",
        );
}

class _TextField extends Widget {
  final TextFieldType type;
  final String className;
  final String pattern;
  final String label;
  final String errorText;

  _TextField({required this.className, required this.type, required this.label, required this.pattern, required this.errorText});

  @override
  Element build() {
    final form = FormElement();
    form.action = '#';

    final div = DivElement();
    div.className = className;

    final inputId = makeUid();
    final input = InputElement();
    input.className = "mdl-textfield__input";
    input.type = type.toString().split('.').last;
    input.id = inputId;
    if (pattern != "") {
      input.pattern = pattern;
    }

    final label = LabelElement();
    label.className = "mdl-textfield__label";
    label.setAttribute("for", inputId);
    label.text = this.label;

    SpanElement? span;
    // Only add error text if there is pattern that cannot be matched
    if (errorText != "" && pattern != "") {
      span = SpanElement();
      span.className = "mdl-textfield__error";
      span.text = errorText;
    }

    div.children.add(input);
    div.children.add(label);
    if (span != null) {
      div.children.add(span);
    }
    form.children.add(div);

    convertToMdlComponent(div);

    return form;
  }
}

// InputElement _inputElement(
//     {String? accept,
//     String? alt,
//     String? autocapitalize,
//     String? autocomplete,
//     bool? autofocus,
//     String? capture,
//     bool? checked,
//     bool? defaultChecked,
//     String? defaultValue,
//     String? dirName,
//     bool? disabled,
//     List<File>? files,
//     String? formAction,
//     String? formEnctype,
//     String? formMethod,
//     bool? formNoValidate,
//     String? formTarget,
//     int? height,
//     bool? incremental,
//     bool? indeterminate,
//     String? max,
//     int? maxLength,
//     String? min,
//     int? minLength,
//     bool? multiple,
//     String? name,
//     String? pattern,
//     String? placeholder,
//     bool? readOnly,
//     bool? required,
//     String? selectionDirection,
//     int? selectionEnd,
//     int? selectionStart,
//     int? size,
//     String? src,
//     String? step,
//     String? type,
//     String? value,
//     DateTime? valueAsDate,
//     num? valueAsNumber,
//     bool? directory,
//     int? width,
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
//   final v = InputElement();
//   if (accept != null) v.accept = accept;
//   if (alt != null) v.alt = alt;
//   if (autocapitalize != null) v.autocapitalize = autocapitalize;
//   if (autocomplete != null) v.autocomplete = autocomplete;
//   if (autofocus != null) v.autofocus = autofocus;
//   if (capture != null) v.capture = capture;
//   if (checked != null) v.checked = checked;
//   if (defaultChecked != null) v.defaultChecked = defaultChecked;
//   if (defaultValue != null) v.defaultValue = defaultValue;
//   if (dirName != null) v.dirName = dirName;
//   if (disabled != null) v.disabled = disabled;
//   if (files != null) v.files = files;
//   if (formAction != null) v.formAction = formAction;
//   if (formEnctype != null) v.formEnctype = formEnctype;
//   if (formMethod != null) v.formMethod = formMethod;
//   if (formNoValidate != null) v.formNoValidate = formNoValidate;
//   if (formTarget != null) v.formTarget = formTarget;
//   if (height != null) v.height = height;
//   if (incremental != null) v.incremental = incremental;
//   if (indeterminate != null) v.indeterminate = indeterminate;
//   if (max != null) v.max = max;
//   if (maxLength != null) v.maxLength = maxLength;
//   if (min != null) v.min = min;
//   if (minLength != null) v.minLength = minLength;
//   if (multiple != null) v.multiple = multiple;
//   if (name != null) v.name = name;
//   if (pattern != null) v.pattern = pattern;
//   if (placeholder != null) v.placeholder = placeholder;
//   if (readOnly != null) v.readOnly = readOnly;
//   if (required != null) v.required = required;
//   if (selectionDirection != null) v.selectionDirection = selectionDirection;
//   if (selectionEnd != null) v.selectionEnd = selectionEnd;
//   if (selectionStart != null) v.selectionStart = selectionStart;
//   if (size != null) v.size = size;
//   if (src != null) v.src = src;
//   if (step != null) v.step = step;
//   if (type != null) v.type = type;
//   if (value != null) v.value = value;
//   if (valueAsDate != null) v.valueAsDate = valueAsDate;
//   if (valueAsNumber != null) v.valueAsNumber = valueAsNumber;
//   if (directory != null) v.directory = directory;
//   if (width != null) v.width = width;
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

// InputElement inputField(
//     {String label = "",
//     String value = "",
//     void Function(InputElement)? onChange,
//     bool readonly = false,
//     bool plain = false,
//     InputFieldType type = InputFieldType.text,
//     InputFieldSize size = InputFieldSize.medium}) {
//   var sizeStr = "";
//   switch (size) {
//     case InputFieldSize.small:
//       sizeStr = "-sm";
//       break;
//     case InputFieldSize.medium:
//       // No medium size class
//       break;
//     case InputFieldSize.large:
//       sizeStr = "-lg";
//       break;
//   }
//   final ie = inputElement(
//     type: type.toString().split(".").last,
//     placeholder: label,
//     readOnly: readonly,
//     className: "form-control$sizeStr ${plain ? "form-control-plaintext" : ""} ${type == InputFieldType.color ? "form-control-color" : ""}",
//   );

//   ie.onChange.listen((event) {
//     if (onChange != null) {
//       onChange(ie);
//     }
//   });

//   return ie;
// }
