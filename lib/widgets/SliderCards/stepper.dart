import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/bookController.dart';

class Steppers extends GetView<BookController> {
  const Steppers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stepper(
          type: StepperType.vertical,
          steps: buildStep(),
          currentStep: controller.currentStep.value,
          onStepContinue: () {
            if (controller.currentStep.value == buildStep().length - 1) {
              controller.saveUpdateBook(
                  '',
                  1,
                  controller.accessionNoController.text.trim(),
                  controller.titleController.text.trim(),
                  controller.authorController.text.trim(),
                  controller.placeController.text.trim(),
                  controller.editionController.text.trim(),
                  controller.yearController.text.trim(),
                  controller.pagesController.text.trim(),
                  controller.sourceController.text.trim(),
                  controller.billNoController.text.trim(),
                  controller.billDateController.text.trim(),
                  controller.costController.text.trim(),
                  controller.callNoController.text.trim(),
                  controller.stockedatController.text.trim());

              // _stepperAddBook(addEditFlag:1, docId:'');

              // print("Send");
            } else {
              controller.currentStep.value++;
            }
          },
          onStepCancel: () {
            controller.currentStep.value == 0
                ? null
                : controller.currentStep.value--;
          },
          onStepTapped: (index) {
            controller.currentStep.value = index;
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text(
                        controller.currentStep.value == buildStep().length - 1
                            ? "Submit"
                            : "Next"),
                    onPressed: details.onStepContinue,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                if (controller.currentStep.value != 0)
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Previous"),
                      onPressed: details.onStepCancel,
                    ),
                  ),
              ],
            );
          },
        ));
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text('Book details'),
          content: Column(
            children: [
              TextFormField(
                controller: controller.accessionNoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Accession Number"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.titleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: " Book Title"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.authorController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Author/Publisher"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.placeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Place (If publisher exist)"),
              ),
              // AuthorsDropdown(),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.yearController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "year"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.pagesController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "pages"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.callNoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Call Number"),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Purchase Details'),
          content: Column(
            children: [
              TextFormField(
                controller: controller.sourceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Source"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.editionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Edition"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.billNoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Bill Number"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.billDateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Bill Date"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.costController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Cost"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller.stockedatController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Stocked At"),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Confirm'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Accession Number: ${controller.accessionNoController.text}"),
              Text(
                "Book Title: ${controller.titleController.text}",
              ),
              Text(
                "Author: ${controller.authorController.text}",
              ),
              Text(
                "Place : ${controller.placeController.text}",
              ),
              Text("Edition: ${controller.editionController.text}"),
              Text("Year:${controller.yearController.text}"),
              Text("Pages: ${controller.pagesController.text}"),
              Text("Call Number: ${controller.callNoController.text}"),
              SizedBox(
                height: 10,
              ),
              Text("Source:${controller.sourceController.text}"),
              Text("Bill Number: ${controller.billNoController.text}"),
              Text("Bill Date: ${controller.billDateController.text}"),
              Text("Cost: ${controller.costController.text}"),
              Text("Stocked at: ${controller.stockedatController.text}"),
            ],
          ),
          isActive: controller.currentStep.value >= 2)
    ];
  }
}
