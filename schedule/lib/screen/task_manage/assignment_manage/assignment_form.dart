import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/confirmation_dialog.dart';
import 'package:schedule/component/datetime_picker.dart';

class AssignmentForm extends StatefulWidget {
  final String typeHandle;
  final bool isComplete;
  final String? title;
  final String? content;
  final String? dateDeadline;
  final String? timeDeadline;
  final String? timeCreated;

  const AssignmentForm({
    this.typeHandle = "Thêm nhiệm vụ môn học",
    this.isComplete = false,
    this.title,
    this.content,
    this.dateDeadline,
    this.timeDeadline,
    this.timeCreated,
    super.key
  });

  @override
  State<StatefulWidget> createState() {
    return _AssignmentFormState();
  }
  
}

class _AssignmentFormState extends State<AssignmentForm> {
  late String _typeHandle;
  late bool _isComplete;
  late String _title;
  late String _content;
  late String? _dateDeadline;
  late String? _timeDeadline;
  late String _timeCreated;
  late num _characters;
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _typeHandle = widget.typeHandle;
    _isComplete = widget.isComplete;
    _title = widget.title ?? "";
    _content = widget.content ?? "";
    _characters = _content.length;
    _timeCreated = widget.timeCreated ??
        DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now()).toString();
    _dateDeadline = widget.dateDeadline;
    _timeDeadline = widget.timeDeadline;
    _titleController = TextEditingController(text: _title);
    _contentController = TextEditingController(text: _content);
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.bluePrimaryColor1,
          title: Text(
              widget.typeHandle,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1
              )
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: Row(
                    children: [
                      const Text(
                        "Deadline:",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      DateTimePicker(
                        date: _dateDeadline,
                        time: _timeDeadline,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: _isComplete ? null : () {
                          ConfirmationDialog.showConfirmationDialog(
                            context,
                            title: "Xác nhận hoàn thành",
                            content: "Bạn xác nhận đã hoàn thành nhiệm vụ này?",
                            cancelLabel: "Hủy",
                            confirmLabel: "Xác nhận"
                          ).then((confirm) {
                            if (confirm == true) {
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Icon(
                          Icons.check_box_sharp,
                          size: 24,
                          color: _isComplete ? Colors.grey.withOpacity(0.3)
                              : (_content.isEmpty && _title.isEmpty ? Colors.grey.withOpacity(0.3)
                              : Colors.grey ),
                        ),
                      ),
                      const SizedBox(width: 36,),
                      GestureDetector(
                        onTap: () {
                          ConfirmationDialog.showConfirmationDialog(
                            context,
                            title: "Xác nhận xóa",
                            content: "Bạn có chắc muốn xóa nhiệm vụ này?",
                            cancelLabel: "Hủy",
                            confirmLabel: "Xóa"
                          )
                            .then((confirm) {
                              if (confirm == true) {
                                Navigator.pop(context);
                              }
                            });
                        },
                        child: SvgPicture.asset(
                          "assets/delete_ic.svg",
                          width: 19,
                          height: 19,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 36,),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        child: const Icon(
                          Icons.save_sharp,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    // autocorrect: false,
                    controller: _titleController,
                    onChanged: (text) {
                      setState(() {
                        _title = text;
                      });
                    },
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return "Vui lòng nhập tiêu đề nhiệm vụ";
                      }
                      return null;
                    },
                    maxLines: null,
                    decoration: const InputDecoration(
                        hintText: "Tiêu đề",
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        errorStyle: TextStyle(
                            fontSize: 10
                        )
                    ),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "$_timeCreated          $_characters ký tự",
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    // autocorrect: false,
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _content = text;
                        _characters = _content.length;
                      });
                    },
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return "Vui lòng nhập nội dung nhiệm vụ";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Nội dung công việc",
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        errorStyle: TextStyle(
                            fontSize: 10
                        )
                    ),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                    maxLines: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}