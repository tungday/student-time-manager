import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/calendar/week_selected.dart';

class TaskHandler extends StatefulWidget {
  final String typeHandle;
  final bool isComplete;
  final String priority;
  final String? title;
  final String? content;
  final String? timeCreated;

  const TaskHandler({
    this.typeHandle = "Thêm công việc",
    this.isComplete = false,
    this.priority = "Cao",
    this.title,
    this.content,
    this.timeCreated,
    super.key
  });

  @override
  State<StatefulWidget> createState() {
    return _TaskHandlerSate();
  }

}

class _TaskHandlerSate extends State<TaskHandler> {
  late bool _isComplete;
  late String _priority;
  late String _title;
  late String _content;
  late String _timeCreated;
  late num _characters;
  final List<String> priorities = ["Cao", "Trung bình", "Thấp"];
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _isComplete = widget.isComplete;
    _priority = widget.priority;
    _title = widget.title ?? "";
    _content = widget.content ?? "";
    _timeCreated = widget.timeCreated ??
        DateFormat("dd/MM/yyyy HH:mm").format(DateTime.now()).toString();
    _characters = _content.length;
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
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 0.5
                        )
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1.0,
                          offset: const Offset(0.0, 0.75)
                      )
                    ]
                ),
                child: const WeekSelected(),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    const Text(
                      "Mức ưu tiên:",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          borderRadius: BorderRadius.circular(8),
                          alignment: AlignmentDirectional.center,
                          padding: const EdgeInsets.only(left: 4),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black
                          ),
                          items: priorities.map<DropdownMenuItem<String>>(
                                  (priority) => DropdownMenuItem(
                                value: priority,
                                child: Text(priority),
                              )
                          ).toList(),
                          value: _priority,
                          onChanged: (priority) {
                            setState(() {
                              _priority = priority ?? "Cao";
                            });
                          }
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _isComplete ? null : () {
                        Navigator.pop(context);
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
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/delete_ic.svg",
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
                      return "Vui lòng nhập tiêu đề công việc";
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
                      return "Vui lòng nhập nội dung công việc";
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
    );
  }

}