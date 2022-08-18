{
	"contents": {
		"390128bf-8d69-4302-a6f8-cc1c14229a99": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "wfso_execute",
			"subject": "Sales Order Approval",
			"name": "wfSO_execute",
			"documentation": "Execute the workflow",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"8b381c0f-f2f3-40c5-99f8-ddaa5622b7ab": {
					"name": "Approve SO"
				},
				"897fb64a-d172-487c-8063-80835df82f17": {
					"name": "Approve"
				},
				"7c9a6a54-f008-4b11-8adb-9258d6a31a50": {
					"name": "processWF"
				},
				"b9e0833d-1d01-4af0-9244-354c58c9f4cf": {
					"name": "Reject"
				},
				"b63ff8f6-508d-4902-90c9-c11ecd3f5427": {
					"name": "ExclusiveGateway1"
				}
			},
			"sequenceFlows": {
				"aecab0c2-b620-4bbf-84c1-06ce2f0ed393": {
					"name": "SequenceFlow2"
				},
				"89d85751-de41-4620-b7a1-aca0d83130ff": {
					"name": "SequenceFlow3"
				},
				"194b525c-632f-4faf-a2dc-b2dd195d96ab": {
					"name": "approve"
				},
				"e2149abc-5aa0-45c7-8d47-5efc75fa999b": {
					"name": "reject"
				},
				"f6ecd525-bd61-4c59-8b5c-c4c2cc2012d9": {
					"name": "SequenceFlow6"
				},
				"507be09c-302f-4ba4-bacb-5f5f72664c1f": {
					"name": "SequenceFlow7"
				},
				"2e1c6a41-d8d2-4701-8379-f66c9c6b05b2": {
					"name": "SequenceFlow8"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"8b381c0f-f2f3-40c5-99f8-ddaa5622b7ab": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Sales Order Approval",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "anupam.capm22@gmail.com",
			"formReference": "/forms/wfSO_execute/inputForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "inputform"
			}, {
				"key": "formRevision",
				"value": "v1"
			}],
			"customAttributes": [],
			"id": "usertask1",
			"name": "Approve SO"
		},
		"897fb64a-d172-487c-8063-80835df82f17": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/wfSO_execute/approve.js",
			"id": "scripttask1",
			"name": "Approve"
		},
		"7c9a6a54-f008-4b11-8adb-9258d6a31a50": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "wfSO_process",
			"path": "/wfpost",
			"httpMethod": "POST",
			"requestVariable": "${context.data}",
			"id": "servicetask1",
			"name": "processWF"
		},
		"b9e0833d-1d01-4af0-9244-354c58c9f4cf": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/wfSO_execute/reject.js",
			"id": "scripttask2",
			"name": "Reject"
		},
		"b63ff8f6-508d-4902-90c9-c11ecd3f5427": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "e2149abc-5aa0-45c7-8d47-5efc75fa999b"
		},
		"aecab0c2-b620-4bbf-84c1-06ce2f0ed393": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "8b381c0f-f2f3-40c5-99f8-ddaa5622b7ab"
		},
		"89d85751-de41-4620-b7a1-aca0d83130ff": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "8b381c0f-f2f3-40c5-99f8-ddaa5622b7ab",
			"targetRef": "b63ff8f6-508d-4902-90c9-c11ecd3f5427"
		},
		"194b525c-632f-4faf-a2dc-b2dd195d96ab": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"approve\"}",
			"id": "sequenceflow4",
			"name": "approve",
			"documentation": "Approved path",
			"sourceRef": "b63ff8f6-508d-4902-90c9-c11ecd3f5427",
			"targetRef": "897fb64a-d172-487c-8063-80835df82f17"
		},
		"e2149abc-5aa0-45c7-8d47-5efc75fa999b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "reject",
			"sourceRef": "b63ff8f6-508d-4902-90c9-c11ecd3f5427",
			"targetRef": "b9e0833d-1d01-4af0-9244-354c58c9f4cf"
		},
		"f6ecd525-bd61-4c59-8b5c-c4c2cc2012d9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "897fb64a-d172-487c-8063-80835df82f17",
			"targetRef": "7c9a6a54-f008-4b11-8adb-9258d6a31a50"
		},
		"507be09c-302f-4ba4-bacb-5f5f72664c1f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "b9e0833d-1d01-4af0-9244-354c58c9f4cf",
			"targetRef": "7c9a6a54-f008-4b11-8adb-9258d6a31a50"
		},
		"2e1c6a41-d8d2-4701-8379-f66c9c6b05b2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "7c9a6a54-f008-4b11-8adb-9258d6a31a50",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"7edc938e-c62e-4971-8676-ea4b16c4f48a": {},
				"3844e111-b7ec-4e75-b178-4f7019aadaea": {},
				"4b018be0-962d-4163-9902-e6953803bba9": {},
				"cc82df45-3dc5-4bb5-b8d2-2c8f0c9ca493": {},
				"bfa0a6fc-c310-4b55-954c-8a43422398a1": {},
				"376202b7-057d-47d5-8cb6-108c8d06034c": {},
				"430514cf-ef71-4a37-bc7d-94046c23cfb6": {},
				"377f0f46-4977-4875-8819-c0243a4b4ace": {},
				"89cf6bb9-0ab0-487d-ab85-d591f1c9fdea": {},
				"39a8f93c-23a2-4152-9cd6-bfdd6d33e98f": {},
				"10450b1e-5075-45d7-8a30-ccee9809907d": {},
				"0bee5fe9-ce8e-46cb-872f-c38f359c0967": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 791,
			"y": 11.5,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"7edc938e-c62e-4971-8676-ea4b16c4f48a": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 113,
			"y": 21,
			"width": 100,
			"height": 60,
			"object": "8b381c0f-f2f3-40c5-99f8-ddaa5622b7ab"
		},
		"3844e111-b7ec-4e75-b178-4f7019aadaea": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 419,
			"y": -85,
			"width": 100,
			"height": 60,
			"object": "897fb64a-d172-487c-8063-80835df82f17"
		},
		"4b018be0-962d-4163-9902-e6953803bba9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 623,
			"y": -1,
			"width": 100,
			"height": 60,
			"object": "7c9a6a54-f008-4b11-8adb-9258d6a31a50"
		},
		"cc82df45-3dc5-4bb5-b8d2-2c8f0c9ca493": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 419,
			"y": 85,
			"width": 100,
			"height": 60,
			"object": "b9e0833d-1d01-4af0-9244-354c58c9f4cf"
		},
		"bfa0a6fc-c310-4b55-954c-8a43422398a1": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 283,
			"y": 21,
			"object": "b63ff8f6-508d-4902-90c9-c11ecd3f5427"
		},
		"376202b7-057d-47d5-8cb6-108c8d06034c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "28,42 78.75,42 78.75,51 163,51",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "7edc938e-c62e-4971-8676-ea4b16c4f48a",
			"object": "aecab0c2-b620-4bbf-84c1-06ce2f0ed393"
		},
		"430514cf-ef71-4a37-bc7d-94046c23cfb6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "163,51 248.25,51 248.25,42 304,42",
			"sourceSymbol": "7edc938e-c62e-4971-8676-ea4b16c4f48a",
			"targetSymbol": "bfa0a6fc-c310-4b55-954c-8a43422398a1",
			"object": "89d85751-de41-4620-b7a1-aca0d83130ff"
		},
		"377f0f46-4977-4875-8819-c0243a4b4ace": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "304,42 372,42 372,-52 449,-52",
			"sourceSymbol": "bfa0a6fc-c310-4b55-954c-8a43422398a1",
			"targetSymbol": "3844e111-b7ec-4e75-b178-4f7019aadaea",
			"object": "194b525c-632f-4faf-a2dc-b2dd195d96ab"
		},
		"89cf6bb9-0ab0-487d-ab85-d591f1c9fdea": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "304,42 372,42 372,120 432,120",
			"sourceSymbol": "bfa0a6fc-c310-4b55-954c-8a43422398a1",
			"targetSymbol": "cc82df45-3dc5-4bb5-b8d2-2c8f0c9ca493",
			"object": "e2149abc-5aa0-45c7-8d47-5efc75fa999b"
		},
		"39a8f93c-23a2-4152-9cd6-bfdd6d33e98f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "469,-55 571.25,-55 571.25,33 641,33",
			"sourceSymbol": "3844e111-b7ec-4e75-b178-4f7019aadaea",
			"targetSymbol": "4b018be0-962d-4163-9902-e6953803bba9",
			"object": "f6ecd525-bd61-4c59-8b5c-c4c2cc2012d9"
		},
		"10450b1e-5075-45d7-8a30-ccee9809907d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "469,115 571.25,115 571.25,39 636,39",
			"sourceSymbol": "cc82df45-3dc5-4bb5-b8d2-2c8f0c9ca493",
			"targetSymbol": "4b018be0-962d-4163-9902-e6953803bba9",
			"object": "507be09c-302f-4ba4-bacb-5f5f72664c1f"
		},
		"0bee5fe9-ce8e-46cb-872f-c38f359c0967": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "673,29 808.5,29",
			"sourceSymbol": "4b018be0-962d-4163-9902-e6953803bba9",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "2e1c6a41-d8d2-4701-8379-f66c9c6b05b2"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 8,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 2,
			"exclusivegateway": 1
		}
	}
}